import 'package:breeds/src/features/detail/inject.dart';
import 'package:flutter/material.dart';
import 'package:breeds/src/core/app.dart';
import 'package:network_breeds/app/network/http_client.dart';
import 'package:breeds/src/features/home/inject.dart';
import 'package:breeds/src/shared/module.dart';
import 'package:breeds/src/shared/widget/favorite/bloc/bloc.dart';
import 'package:utils_breeds/utils/config/client_config.dart';
import 'package:utils_breeds/utils/config/main/bloc/bloc.dart' as app;

class AppModule extends Module {
  @override
  List<Bind> get binds {
    return [
      Bind.lazySingleton((i) => app.Bloc()),
      Bind<XigoHttpClient>(
        (i) => XigoHttpClient().getInstance(i<AppConfig>()),
      ),
      Bind(
        (i) {
          return AppConfig(
            environment: App.instance.environment,
            config: App.instance.config,
          )..version = App.instance.version;
        },
        isLazy: false,
      ),
      Bind.lazySingleton((i) => BlocFavorite()),
      ...InjectHomeUseCase().binds,
      ...InjectDetailUseCase().binds,
      Bind((i) => GlobalKey<NavigatorState>()),
    ];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ModuleRoute('/', module: GlobalModule()),
    ];
  }
}
