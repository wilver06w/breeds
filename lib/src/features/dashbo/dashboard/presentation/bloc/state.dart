part of 'bloc.dart';

abstract class DashboardState extends Equatable {
  final Model model;
  const DashboardState(this.model);

  @override
  List<Object?> get props => [model];
}

class InitialState extends DashboardState {
  const InitialState(Model model) : super(model);
}

class ChangedPositionState extends DashboardState {
  const ChangedPositionState(Model model) : super(model);
}

class Model extends Equatable {
  const Model({
    this.position = 0,
  });

  final int position;

  Model copyWith({
    int? position,
  }) {
    return Model(
      position: position ?? this.position,
    );
  }

  @override
  List<Object?> get props {
    return [position];
  }
}
