import 'dart:async';

import 'package:bloc/bloc.dart' as bloc;
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models_breeds/app/models/clien.dart';
import 'package:utils_breeds/utils/config/client_config.dart';
import 'package:utils_breeds/utils/preferences.dart';
import 'package:breeds/src/features/splash/ui/repository.dart';
import 'package:network_breeds/app/network/http_client.dart';
import 'package:network_breeds/app/network/token.dart';

part 'event.dart';
part 'state.dart';

class BlocSplash extends bloc.Bloc<EventSplash, StateSplash> {
  BlocSplash({
    required this.repository,
    required this.tokenRepository,
    required this.httpClient,
    required this.app,
    required this.prefs,
  }) : super(const InitialState(Model())) {
    on<FakeLoadingEvent>(_onFakeLoadingEvent);
  }

  final TokenRepository tokenRepository;
  final Repository repository;
  final XigoHttpClient httpClient;
  final AppConfig app;
  final Preferences prefs;

  Future<void> _onFakeLoadingEvent(
    FakeLoadingEvent event,
    Emitter<StateSplash> emit,
  ) async {
    try {
      await isTokenExpired();

      if (!prefs.isLogged || tokenRepository.isTokenExpired(prefs.msToken)) {
        emit(
          UnLoggedState(
            state.model.copyWith(
              key: UniqueKey(),
            ),
          ),
        );
        return;
      }
      Clien client = await repository.getClient();
      app.clien = client;

      emit(LoadedState(state.model));
    } catch (e) {
      emit(ErrorState(state.model));
    }
  }

  Future<void> isTokenExpired() async {
    if (tokenRepository.isTokenExpired(prefs.msToken)) {
      await tokenRepository.refreshToken(
        prefs: prefs,
        httpClient: httpClient,
      );
      prefs.reload();
    }
  }
}
