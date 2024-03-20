part of 'bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class LoadDataCategoriasEvent extends DetailEvent {}