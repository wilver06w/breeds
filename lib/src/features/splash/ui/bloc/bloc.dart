import 'dart:async';

import 'package:bloc/bloc.dart' as bloc;
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event.dart';
part 'state.dart';

class BlocSplash extends bloc.Bloc<EventSplash, StateSplash> {
  BlocSplash() : super(const InitialState(Model())) {
    on<FakeLoadingEvent>(_onFakeLoadingEvent);
  }

  Future<void> _onFakeLoadingEvent(
    FakeLoadingEvent event,
    Emitter<StateSplash> emit,
  ) async {
    try {
      await Future.delayed(const Duration(seconds: 5), () {
        emit(LoadedState(state.model));
      });
    } catch (e) {
      emit(ErrorState(state.model));
    }
  }
}
