part of 'bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadBannerEvent extends HomeEvent {}

class LoadDataCategoriasEvent extends HomeEvent {}

class BanListEvent extends HomeEvent {}
