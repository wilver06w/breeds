import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breeds/src/features/splash/bloc/bloc.dart' as bloc;
import 'package:breeds/src/features/splash/repository.dart';
import 'package:lottie/lottie.dart';
import 'package:utils_breeds/utils/config/client_config.dart';
import 'package:utils_breeds/utils/constant/colors.dart';
import 'package:network_breeds/app/network/http_client.dart';
import 'package:network_breeds/app/network/token.dart';
import 'package:utils_breeds/utils/constant/navigation.dart';
import 'package:l10n_breeds/app/breeds_ui.dart';
import 'package:utils_breeds/utils/constant/responsive.dart';
import 'package:utils_breeds/utils/constant/spacing.dart';
import 'package:utils_breeds/utils/preferences.dart';

part 'package:breeds/src/features/splash/listeners/core.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    final app = Modular.get<AppConfig>();
    final prefs = Modular.get<Preferences>();
    final xigoHttpClient = Modular.get<XigoHttpClient>();
    return Scaffold(
      backgroundColor: ProTiendasUiColors.backgroundColor,
      body: BlocProvider(
        create: (context) => bloc.Bloc(
          repository: Repository(
            xigoHttpClient: xigoHttpClient,
          ),
          app: app,
          prefs: prefs,
          tokenRepository: TokenRepository(),
          httpClient: xigoHttpClient,
        )..add(bloc.InitEvent()),
        child: BlocListener<bloc.Bloc, bloc.State>(
          listener: listener,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset(
                //   BreedUiValues.acacomproLogo,
                // ),
                Lottie.asset(
                  BreedUiValues.loadingAnimations,
                  height: YuGiOhResponsive.heightSizeByContext(
                    context,
                    pixels: ProTiendaSpacing.xs,
                  ),
                  width: YuGiOhResponsive.withSizeByContext(
                    context,
                    pixels: ProTiendaSpacing.xs,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
