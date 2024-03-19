part of 'bloc.dart';

@immutable
abstract class State extends Equatable {
  final Model model;
  const State(this.model);

  @override
  List<Object> get props => [model];
}

class InitialState extends State {
  const InitialState(Model model) : super(model);
}

class LoadedState extends State {
  const LoadedState(super.model);
}

class ErrorState extends State {
  const ErrorState(super.model);
}

class UnLoggedState extends State {
  const UnLoggedState(Model model) : super(model);
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
