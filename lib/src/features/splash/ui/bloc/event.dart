part of 'bloc.dart';

abstract class EventSplash extends Equatable {
  const EventSplash();

  @override
  List<Object?> get props => [];
}

class FakeLoadingEvent extends EventSplash {}
