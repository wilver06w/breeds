import 'package:bloc/bloc.dart';
import 'package:breeds/src/features/detail/domain/models/breed_detail.dart';
import 'package:breeds/src/features/detail/domain/usecases/breed_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event.dart';
part 'state.dart';

class BlocDetail extends Bloc<DetailEvent, DetailState> {
  BlocDetail({
    required this.getBreedUseCase,
  }) : super(const InitialState(Model())) {
    on<LoadBreedDetailEvent>(_onLoadBreedDetailEvent);
  }

  final GetBreedUseCase getBreedUseCase;

  Future<void> _onLoadBreedDetailEvent(
    LoadBreedDetailEvent event,
    Emitter<DetailState> emit,
  ) async {
    emit(LoadingBreedState(state.model));

    final breedDetail = await getBreedUseCase.call(event.idBreeds);

    breedDetail.fold((l) {
      emit(
        ErrorBreedState(
          model: state.model,
          message: l.errorMessage,
        ),
      );
    }, (r) {
      emit(
        LoadedBreedState(
          state.model.copyWith(
            breedDetail: r,
          ),
        ),
      );
    });
  }
}
