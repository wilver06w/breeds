import 'package:breeds/src/features/splash/ui/bloc/bloc.dart';
import 'package:breeds_widget/app/widget/body_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:l10n_breeds/app/breeds_ui.dart';
import 'package:lottie/lottie.dart';
import 'package:network_breeds/app/network/http_client.dart';
import 'package:utils_breeds/utils/config/client_config.dart';
import 'package:utils_breeds/utils/constant/colors.dart';
import 'package:utils_breeds/utils/constant/navigation.dart';
import 'package:utils_breeds/utils/constant/spacing.dart';
import 'package:utils_breeds/utils/helpers/text/text.dart';

part 'package:breeds/src/features/splash/ui/listeners/core.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    final app = Modular.get<AppConfig>();
    return Scaffold(
      backgroundColor: ProTiendasUiColors.backgroundColor,
      bottomNavigationBar: BodyFooter(app: app),
      body: BlocProvider(
        create: (context) => BlocSplash()..add(FakeLoadingEvent()),
        child: BlocListener<BlocSplash, StateSplash>(
          listener: listener,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                XigoTextCustom(
                  BreedUiValues.appName,
                  fontSize: 32,
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
