part of 'bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadListBreedEvent extends HomeEvent {}

class SearchBreedEvent extends HomeEvent {
  const SearchBreedEvent({required this.search});

  final String search;
}
