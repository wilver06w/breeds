part of 'bloc.dart';

abstract class HomeState extends Equatable {
  final Model model;
  const HomeState(this.model);

  @override
  List<Object?> get props => [model];
}

class InitialState extends HomeState {
  const InitialState(super.model);
}

class LoadingListBreedState extends HomeState {
  const LoadingListBreedState(super.model);
}

class LoadingSearchState extends HomeState {
  const LoadingSearchState(super.model);
}

class SearchBreedState extends HomeState {
  const SearchBreedState(super.model);
}

class LoadedListBreedState extends HomeState {
  const LoadedListBreedState(super.model);
}

class ErrorListBreedState extends HomeState {
  const ErrorListBreedState({
    required Model model,
    this.message = '',
  }) : super(model);

  final String message;
}

class Model extends Equatable {
  const Model({
    this.listBreed = const [],
    this.breedSearch = '',
  });

  final List<Breed> listBreed;
  final String breedSearch;

  Model copyWith({
    List<Breed>? listBreed,
    String? breedSearch,
  }) {
    return Model(
      listBreed: listBreed ?? this.listBreed,
      breedSearch: breedSearch ?? this.breedSearch,
    );
  }

  List<Breed> get getListArchetypeFilter => breedSearch.isEmpty
      ? listBreed
      : Functions.getListFilter(
          search: breedSearch,
          listBreed: listBreed,
        );
  @override
  List<Object?> get props {
    return [
      listBreed,
    ];
  }
}
