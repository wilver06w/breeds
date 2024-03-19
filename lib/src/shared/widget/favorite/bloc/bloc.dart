import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event.dart';
part 'state.dart';

class BlocFavorite extends Bloc<FavoriteEvent, FavoriteState> {
  BlocFavorite() : super(const InitialState(Model())) {
    on<OnChangeFavoriteEvent>(_onChangeFavoriteEvent);
    on<OnAddEvent>(_onAddEvent);
    on<OnDeleteEvent>(_onDeleteEvent);
  }

  Future<void> _onChangeFavoriteEvent(
    OnChangeFavoriteEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    final listFavorites = state.model.favorites;
    if (listFavorites.contains(event.id)) {
      add(OnDeleteEvent(id: event.id));
    } else {
      add(OnAddEvent(id: event.id));
    }
  }

  Future<void> _onAddEvent(
    OnAddEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    final favorites = [...state.model.favorites, event.id];
    emit(
      AddedState(
        state.model.copyWith(
          favorites: favorites,
        ),
      ),
    );
  }

  Future<void> _onDeleteEvent(
    OnDeleteEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    final listFavorites = state.model.favorites;
    listFavorites.removeWhere((element) => element == event.id);

    emit(
      DeletedState(
        model: state.model.copyWith(
          favorites: listFavorites,
        ),
        key: UniqueKey(),
      ),
    );
  }
}
