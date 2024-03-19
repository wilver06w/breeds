part of 'bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class OnChangeFavoriteEvent extends FavoriteEvent {
  const OnChangeFavoriteEvent({
    required this.id,
  });

  final int id;
}

class OnAddEvent extends FavoriteEvent {
  const OnAddEvent({
    required this.id,
  });

  final int id;
}

class OnDeleteEvent extends FavoriteEvent {
  const OnDeleteEvent({
    required this.id,
  });

  final int id;
}
