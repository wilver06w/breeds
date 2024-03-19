import 'package:breeds_widget/app/widget/app_bar_global.dart';
import 'package:breeds_widget/app/widget/banner.dart';
import 'package:breeds_widget/app/widget/imagen_widget.dart';
import 'package:breeds_widget/app/widget/title_sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:oktoast/oktoast.dart';
import 'package:breeds/src/core/network/http_client.dart'
    hide ModularWatchExtension;
import 'package:breeds/src/core/utils/constant/colors.dart';
import 'package:breeds/src/core/utils/constant/navigation.dart';
import 'package:breeds/src/core/utils/constant/protienda_ui.dart';
import 'package:breeds/src/core/utils/constant/spacing.dart';
import 'package:breeds/src/core/utils/helpers/text/text.dart';
import 'package:breeds/src/core/utils/loading.dart';
import 'package:breeds/src/features/dashbo/home/domain/usecases/banlist_usecase.dart';
import 'package:breeds/src/features/dashbo/home/domain/usecases/banner_usecase.dart';
import 'package:breeds/src/features/dashbo/home/domain/usecases/categorias_usecase.dart';
import 'package:breeds/src/features/dashbo/home/presentation/bloc/bloc.dart';
import 'package:breeds/src/features/dashbo/repository.dart';
import 'package:breeds/src/shared/widget/card_product_vertical.dart';

part 'package:breeds/src/features/dashbo/home/presentation/_sections/body.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    final xigoHttpClient = Modular.get<XigoHttpClient>();
    final listBanUseCase = Modular.get<ListBanUseCase>();
    final bannerUseCase = Modular.get<BannerUseCase>();
    final categoriesUseCase = Modular.get<CategoriesUseCase>();
    return BlocProvider<BlocHome>(
      create: (context) => BlocHome(
        listBanUseCase: listBanUseCase,
        bannerUseCase: bannerUseCase,
        categoriesUseCase: categoriesUseCase,
        repository: Repository(
          yuGiOhHttpClient: xigoHttpClient,
        ),
      )
        ..add(LoadBannerEvent())
        ..add(LoadDataCategoriasEvent()),
      child: BlocListener<BlocHome, HomeState>(
        listener: _listener,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBarGlobal(
            havIconLeft: false,
            icon: const Icon(
              Icons.menu_outlined,
              color: ProTiendasUiColors.secondaryColor,
            ),
            onTapIcon: () {},
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
  if (state is LoadingBannerState || state is LoadingDataCategoriasState) {
    YuGiOhLoading.show(context);
  } else if (state is ErrorBannerState) {
    Navigator.pop(context);
    showToast(
      state.message,
      backgroundColor: ProTiendasUiColors.rybBlue,
      textStyle: const TextStyle(
        color: Colors.white,
      ),
    );
  } else if (state is ErrorDataCategoriasState) {
    Navigator.pop(context);
    showToast(
      state.message,
      backgroundColor: ProTiendasUiColors.rybBlue,
      textStyle: const TextStyle(
        color: Colors.white,
      ),
    );
  } else if (state is LoadedBannerState || state is LoadedDataCategoriasState) {
    Navigator.pop(context);
  }
}
