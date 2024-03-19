import 'package:breeds_widget/app/widget/body_footer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breeds/src/features/splash/ui/bloc/bloc.dart';
import 'package:breeds/src/features/splash/ui/repository.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:utils_breeds/utils/config/client_config.dart';
import 'package:utils_breeds/utils/constant/colors.dart';
import 'package:network_breeds/app/network/http_client.dart';
import 'package:network_breeds/app/network/token.dart';
import 'package:utils_breeds/utils/constant/navigation.dart';
import 'package:l10n_breeds/app/breeds_ui.dart';
import 'package:utils_breeds/utils/constant/responsive.dart';
import 'package:utils_breeds/utils/constant/spacing.dart';
import 'package:utils_breeds/utils/helpers/text/text.dart';
import 'package:utils_breeds/utils/preferences.dart';

part 'package:breeds/src/features/splash/ui/listeners/core.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    final app = Modular.get<AppConfig>();
    final prefs = Modular.get<Preferences>();
    final xigoHttpClient = Modular.get<XigoHttpClient>();
    return Scaffold(
      backgroundColor: ProTiendasUiColors.backgroundColor,
      bottomNavigationBar: BodyFooter(app: app),
      body: BlocProvider(
        create: (context) => BlocSplash(
          repository: Repository(
            xigoHttpClient: xigoHttpClient,
          ),
          app: app,
          prefs: prefs,
          tokenRepository: TokenRepository(),
          httpClient: xigoHttpClient,
        )..add(FakeLoadingEvent()),
        child: BlocListener<BlocSplash, StateSplash>(
          listener: listener,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                XigoTextCustom(
                  BreedUiValues.appName,
                  fontSize: 20,
                  weight: FontWeight.bold,
                  color: ProTiendasUiColors.black,
                  fontStyle: GoogleFonts.lato().fontStyle,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: ProTiendaSpacing.md,
                  ).copyWith(top: ProTiendaSpacing.xxl),
                  child: Lottie.asset(
                    BreedUiValues.catSplashAnimation,
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
