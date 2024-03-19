import 'package:breeds_widget/app/widget/app_bar_global.dart';
import 'package:breeds_widget/app/widget/button/btn.dart';
import 'package:breeds_widget/app/widget/card_cart/card_product_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:breeds/src/core/utils/constant/colors.dart';
import 'package:breeds/src/core/utils/constant/navigation.dart';
import 'package:breeds/src/core/utils/constant/protienda_ui.dart';
import 'package:breeds/src/core/utils/constant/spacing.dart';
import 'package:breeds/src/core/utils/helpers/text/text.dart';

part 'package:breeds/src/features/cart/_childrens/home/_sections/body.dart';
part 'package:breeds/src/features/cart/_childrens/home/_sections/bottom.dart';
part 'package:breeds/src/features/cart/_childrens/home/_sections/item_resum.dart';
part 'package:breeds/src/features/cart/_childrens/home/_sections/item_total.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProTiendasUiColors.white,
      appBar: AppBarGlobal(
        onTapIcon: () {
          Modular.to.pop();
        },
        haveSearch: false,
        title: ProTiendasUiValues.shoppingCart,
        havCart: false,
      ),
      bottomNavigationBar: const Bottom(),
      body: const Body(),
    );
  }
}
