part of 'bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class ChangePositionEvent extends DashboardEvent {
  const ChangePositionEvent({
    required this.position,
  });

  final int position;
}
