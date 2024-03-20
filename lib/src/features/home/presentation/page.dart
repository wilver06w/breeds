import 'package:breeds/src/features/home/domain/usecases/breedlist_usecase.dart';
import 'package:breeds/src/features/home/presentation/bloc/bloc.dart';
import 'package:breeds/src/shared/widget/card_product_vertical.dart';
import 'package:breeds_widget/app/widget/app_bar_global.dart';
import 'package:breeds_widget/app/widget/banner.dart';
import 'package:breeds_widget/app/widget/body_footer.dart';
import 'package:breeds_widget/app/widget/title_sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:l10n_breeds/app/breeds_ui.dart';
import 'package:network_breeds/app/network/http_client.dart'
    hide ModularWatchExtension;
import 'package:oktoast/oktoast.dart';
import 'package:utils_breeds/utils/config/client_config.dart';
import 'package:utils_breeds/utils/constant/colors.dart';
import 'package:utils_breeds/utils/constant/navigation.dart';
import 'package:utils_breeds/utils/constant/spacing.dart';
import 'package:utils_breeds/utils/helpers/text/xigo_text.dart';
import 'package:utils_breeds/utils/loading.dart';

part 'package:breeds/src/features/home/presentation/_sections/body.dart';
part 'package:breeds/src/features/home/presentation/_sections/card_image_grid.dart';
part 'package:breeds/src/features/home/presentation/_sections/search_separated.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    final app = Modular.get<AppConfig>();
    final listBanUseCase = Modular.get<ListBreedUseCase>();
    return BlocProvider<BlocHome>(
      create: (context) => BlocHome(
        listBreedUseCase: listBanUseCase,
      )..add(LoadListBreedEvent()),
      child: BlocListener<BlocHome, HomeState>(
        listener: _listener,
        child: Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: BodyFooter(version: app.version),
          appBar: AppBarGlobal(
            widgetSearch: Builder(builder: (context) {
              return const SearchSeparated();
            }),
            havIconLeft: false,
            onTapIcon: () {},
            onChanged: (value) {},
          ),
          body: const SafeArea(
            child: Body(),
          ),
        ),
      ),
    );
  }
}

Future<void> _listener(BuildContext context, HomeState state) async {
  if (state is LoadingListBreedState) {
    YuGiOhLoading.show(context);
  } else if (state is ErrorListBreedState) {
    Navigator.pop(context);
    showToast(
      state.message,
      backgroundColor: ProTiendasUiColors.rybBlue,
      textStyle: const TextStyle(
        color: Colors.white,
      ),
    );
  } else if (state is LoadedListBreedState) {
    Navigator.pop(context);
  }
}
