part of 'bloc.dart';

abstract class FavoriteState extends Equatable {
  final Model model;
  const FavoriteState(this.model);

  @override
  List<Object?> get props => [model];
}

class InitialState extends FavoriteState {
  const InitialState(super.model);
}

class ChangingState extends FavoriteState {
  const ChangingState(super.model);
}

class AddedState extends FavoriteState {
  const AddedState(super.model);
}

class DeletedState extends FavoriteState {
  const DeletedState({
    required Model model,
    required this.key,
  }) : super(model);
  final UniqueKey key;
}

class Model extends Equatable {
  const Model({
    this.favorites = const [],
  });

  final List<Breed> favorites;

  Model copyWith({
    List<Breed>? favorites,
  }) {
    return Model(
      favorites: favorites ?? this.favorites,
    );
  }

  @override
  List<Object?> get props {
    return [
      favorites,
    ];
  }
}
