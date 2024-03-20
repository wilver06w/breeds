part of 'bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class LoadBreedDetailEvent extends DetailEvent {
  final String idBreeds;

  const LoadBreedDetailEvent({required this.idBreeds});
}
