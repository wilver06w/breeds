import 'package:breeds_widget/app/widget/app_bar_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:breeds/src/core/utils/constant/colors.dart';
import 'package:breeds/src/core/utils/constant/navigation.dart';
import 'package:breeds/src/core/utils/constant/spacing.dart';
import 'package:breeds/src/core/utils/helpers/text/text.dart';
import 'package:breeds/src/core/utils/constant/protienda_ui.dart';

part 'package:breeds/src/features/payment_method/home/_sections/bottom.dart';
part 'package:breeds/src/features/payment_method/home/_sections/item_payment.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const Bottom(),
      appBar: AppBarGlobal(
        onTapIcon: () {
          Modular.to.pop();
        },
        haveSearch: false,
        havCart: false,
        title: ProTiendasUiValues.paymentMethod,
      ),
      body: ListView(
        padding: const EdgeInsets.all(ProTiendaSpacing.lg),
        children: [
          XigoTextHeading6(
            ProTiendasUiValues.howWantPay,
            weight: FontWeight.w500,
          ),
          const Gap(ProTiendaSpacing.xxl),
          Padding(
            padding: const EdgeInsets.all(ProTiendaSpacing.md),
            child: Column(
              children: [
                ItemPaymentMethod(
                  onTap: () {
                    ProTiendasRoute.navAddPayment();
                  },
                  title: ProTiendasUiValues.newDebitCard,
                  icon: ProTiendasUiValues.icTarjet,
                ),
                const Gap(ProTiendaSpacing.sl),
                ItemPaymentMethod(
                  onTap: () {},
                  title: ProTiendasUiValues.newDebitCard,
                  icon: ProTiendasUiValues.icTarjet,
                ),
                const Gap(ProTiendaSpacing.sl),
                ItemPaymentMethod(
                  onTap: () {},
                  title: ProTiendasUiValues.bankTransferWithPse,
                  icon: ProTiendasUiValues.icBank,
                ),
                const Gap(ProTiendaSpacing.sl),
                ItemPaymentMethod(
                  onTap: () {},
                  title: ProTiendasUiValues.efecty,
                  icon: ProTiendasUiValues.icEfecty,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
