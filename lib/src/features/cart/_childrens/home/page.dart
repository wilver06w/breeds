import 'package:breeds/src/shared/widget/card_product_vertical.dart';
import 'package:breeds/src/shared/widget/favorite/bloc/bloc.dart';
import 'package:breeds_widget/app/widget/app_bar_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:l10n_breeds/app/breeds_ui.dart';
import 'package:utils_breeds/utils/constant/colors.dart';
import 'package:utils_breeds/utils/constant/spacing.dart';
import 'package:utils_breeds/utils/helpers/text/text.dart';

part 'package:breeds/src/features/cart/_childrens/home/_sections/body.dart';
part 'package:breeds/src/features/cart/_childrens/home/_sections/item_resum.dart';
part 'package:breeds/src/features/cart/_childrens/home/_sections/item_total.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: Modular.get<BlocFavorite>(),
      child: Scaffold(
        backgroundColor: ProTiendasUiColors.white,
        appBar: AppBarGlobal(
          onTapIcon: () {
            Modular.to.pop();
          },
          haveSearch: false,
          title: BreedUiValues.favorites,
          havCart: false,
        ),
        body: const Body(),
      ),
    );
  }
}
