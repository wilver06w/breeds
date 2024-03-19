import 'package:breeds_widget/app/widget/app_bar_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:utils_breeds/utils/constant/colors.dart';
import 'package:utils_breeds/utils/constant/navigation.dart';
import 'package:utils_breeds/utils/constant/spacing.dart';
import 'package:utils_breeds/utils/helpers/text/text.dart';
import 'package:l10n_breeds/app/breeds_ui.dart';

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
        title: BreedUiValues.paymentMethod,
      ),
      body: ListView(
        padding: const EdgeInsets.all(ProTiendaSpacing.lg),
        children: [
          XigoTextHeading6(
            BreedUiValues.howWantPay,
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
                  title: BreedUiValues.newDebitCard,
                  icon: BreedUiValues.icTarjet,
                ),
                const Gap(ProTiendaSpacing.sl),
                ItemPaymentMethod(
                  onTap: () {},
                  title: BreedUiValues.newDebitCard,
                  icon: BreedUiValues.icTarjet,
                ),
                const Gap(ProTiendaSpacing.sl),
                ItemPaymentMethod(
                  onTap: () {},
                  title: BreedUiValues.bankTransferWithPse,
                  icon: BreedUiValues.icBank,
                ),
                const Gap(ProTiendaSpacing.sl),
                ItemPaymentMethod(
                  onTap: () {},
                  title: BreedUiValues.efecty,
                  icon: BreedUiValues.icEfecty,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
