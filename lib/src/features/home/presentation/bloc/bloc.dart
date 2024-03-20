import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breeds/src/features/home/domain/models/breed.dart';
import 'package:breeds/src/features/home/domain/usecases/breedlist_usecase.dart';
import 'package:models_breeds/app/models/data_categoria.dart';

part 'event.dart';
part 'state.dart';

class BlocHome extends Bloc<HomeEvent, HomeState> {
  BlocHome({
    required this.listBreedUseCase,
  }) : super(const InitialState(Model())) {
    on<LoadListBreedEvent>(_onLoadListBreedEvent);
  }
  final ListBreedUseCase listBreedUseCase;

  Future<void> _onLoadListBreedEvent(
    LoadListBreedEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(LoadingBannerState(state.model));

    final listBreeds = await listBreedUseCase.call();

    listBreeds.fold((l) {
      emit(
        ErrorBannerState(
          model: state.model,
          message: l.errorMessage,
        ),
      );
    }, (r) {
      emit(
        LoadedBannerState(
          state.model.copyWith(
            listBreed: r,
          ),
        ),
      );
    });
  }
}
