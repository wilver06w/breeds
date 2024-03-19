import 'package:bloc/bloc.dart';
import 'package:network_breeds/app/network/http_client.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models_breeds/app/models/data_login.dart';
import 'package:models_breeds/app/models/token.dart';
import 'package:utils_breeds/utils/config/client_config.dart';

import 'package:breeds/src/features/auth/_childrens/register/repository.dart';
import 'package:utils_breeds/utils/preferences.dart';

part 'event.dart';
part 'state.dart';

class BlocRegister extends Bloc<RegisterEvent, RegisterState> {
  BlocRegister({
    required this.httpClient,
    required this.prefs,
    required this.appConfig,
    required this.repository,
  }) : super(const InitialState(Model())) {
    on<ChangeEmailEvent>(_onChangeEmailEvent);
    on<ChangePasswordEvent>(_onChangePasswordEvent);
    on<SendRegisterEvent>(_onSendRegisterEvent);
    on<ChangeNameEvent>(_onChangeNameEvent);
    on<ChangeNumberPhone>(_onChangeNumberPhone);
  }
  final Repository repository;
  final XigoHttpClient httpClient;
  final AppConfig appConfig;
  final Preferences prefs;

  void _onChangeEmailEvent(
    ChangeEmailEvent event,
    Emitter<RegisterState> emit,
  ) {
    emit(
      ChangedEmailState(
        state.model.copyWith(
          email: event.email,
        ),
      ),
    );
  }

  void _onChangePasswordEvent(
    ChangePasswordEvent event,
    Emitter<RegisterState> emit,
  ) {
    emit(
      ChangedPasswordState(
        state.model.copyWith(
          password: event.password,
        ),
      ),
    );
  }

  void _onChangeNameEvent(
    ChangeNameEvent event,
    Emitter<RegisterState> emit,
  ) {
    emit(
      ChangedNameState(
        state.model.copyWith(
          name: event.name,
        ),
      ),
    );
  }

  void _onChangeNumberPhone(
    ChangeNumberPhone event,
    Emitter<RegisterState> emit,
  ) {
    emit(
      ChangedLastNameState(
        state.model.copyWith(
          numberPhone: event.numberPhone,
        ),
      ),
    );
  }

  Future<void> _onSendRegisterEvent(
    SendRegisterEvent event,
    Emitter<RegisterState> emit,
  ) async {
    try {
      emit(LoadingRegisterState(state.model));

      final data = {
        'nombre': state.model.name,
        'apellido': state.model.numberPhone,
        'email': state.model.email,
        'password': state.model.password,
      };
      final dataLogin = await repository.sendRegister(data);
      appConfig.clien = dataLogin.data.userData;

      final token = Token.fromJson(
        {'accessToken': dataLogin.data.accessToken},
      );
      prefs.isLogged = true;
      prefs.msToken = token;

      httpClient.updateHeadersWithToken(token);

      emit(
        LoadedRegisterState(
          state.model.copyWith(
            dataLogin: dataLogin,
          ),
        ),
      );
    } catch (e) {
      if (e is DioException) {
        emit(
          ErrorRegisterState(
            model: state.model,
            message: e.response?.data['message'] ?? '',
          ),
        );
        return;
      }
      emit(
        ErrorRegisterState(
          model: state.model,
          message: e.toString(),
        ),
      );
    }
  }
}
