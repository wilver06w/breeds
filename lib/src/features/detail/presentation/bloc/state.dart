part of 'bloc.dart';

abstract class DetailState extends Equatable {
  final Model model;
  const DetailState(this.model);

  @override
  List<Object?> get props => [model];
}

class InitialState extends DetailState {
  const InitialState(super.model);
}

class LoadingBreedState extends DetailState {
  const LoadingBreedState(super.model);
}

class LoadedBreedState extends DetailState {
  const LoadedBreedState(super.model);
}

class ErrorBreedState extends DetailState {
  const ErrorBreedState({
    required Model model,
    this.message = '',
  }) : super(model);

  final String message;
}

class Model extends Equatable {
  const Model({
    this.id = '',
    this.breedDetail,
  });

  final String id;
  final BreedDetail? breedDetail;

  Model copyWith({
    String? id,
    BreedDetail? breedDetail,
  }) {
    return Model(
      id: id ?? this.id,
      breedDetail: breedDetail ?? this.breedDetail,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      breedDetail,
    ];
  }
}
