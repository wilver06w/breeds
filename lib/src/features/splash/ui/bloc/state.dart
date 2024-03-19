part of 'bloc.dart';

@immutable
abstract class StateSplash extends Equatable {
  final Model model;
  const StateSplash(this.model);

  @override
  List<Object> get props => [model];
}

class InitialState extends StateSplash {
  const InitialState(super.model);
}

class LoadedState extends StateSplash {
  const LoadedState(super.model);
}

class ErrorState extends StateSplash {
  const ErrorState(super.model);
}

class UnLoggedState extends StateSplash {
  const UnLoggedState(super.model);
}

class Model extends Equatable {
  const Model();
  Model copyWith({
    required key,
  }) {
    return const Model();
  }

  @override
  List<Object?> get props => [];
}
