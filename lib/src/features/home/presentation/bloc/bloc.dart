import 'package:bloc/bloc.dart';
import 'package:breeds/src/features/home/domain/usecases/breedlist_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models_breeds/app/models/breed.dart';
import 'package:utils_breeds/utils/functions.dart';

part 'event.dart';
part 'state.dart';

class BlocHome extends Bloc<HomeEvent, HomeState> {
  BlocHome({
    required this.listBreedUseCase,
  }) : super(const InitialState(Model())) {
    on<LoadListBreedEvent>(_onLoadListBreedEvent);
    on<SearchBreedEvent>(_onSearchBreedEvent);
  }
  final ListBreedUseCase listBreedUseCase;

  Future<void> _onLoadListBreedEvent(
    LoadListBreedEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(LoadingListBreedState(state.model));

    final listBreeds = await listBreedUseCase.call();

    listBreeds.fold((l) {
      emit(
        ErrorListBreedState(
          model: state.model,
          message: l.errorMessage,
        ),
      );
    }, (r) {
      emit(
        LoadedListBreedState(
          state.model.copyWith(
            listBreed: r,
          ),
        ),
      );
    });
  }

  Future<void> _onSearchBreedEvent(
    SearchBreedEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(LoadingSearchState(state.model));
    emit(SearchBreedState(state.model.copyWith(breedSearch: event.search)));
  }
}
