import 'package:breeds_widget/app/widget/app_bar_global.dart';
import 'package:breeds_widget/app/widget/container_circle_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:l10n_breeds/app/breeds_ui.dart';
import 'package:utils_breeds/utils/constant/colors.dart';
import 'package:utils_breeds/utils/constant/navigation.dart';
import 'package:utils_breeds/utils/constant/spacing.dart';
import 'package:utils_breeds/utils/helpers/text/text.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarGlobal(
        onTapIcon: () {
          Modular.to.pop();
        },
        haveSearch: false,
        havCart: false,
        title: BreedUiValues.delivery,
      ),
      body: ListView(
        padding: const EdgeInsets.all(ProTiendaSpacing.lg),
        children: [
          XigoTextHeading6(
            BreedUiValues.chooseDeliveryMethod,
            weight: FontWeight.w500,
          ),
          const Gap(ProTiendaSpacing.lg),
          ContainerCircleColor(
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          BreedUiValues.circleGrey,
                        ),
                        const Gap(ProTiendaSpacing.sm),
                        XigoTextLarge(
                          BreedUiValues.sendHome,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                    XigoTextSmall(
                      BreedUiValues.sendFree,
                      color: ProTiendasUiColors.crayolaGreen,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
                const Divider(
                  thickness: 0.5,
                  color: ProTiendasUiColors.silverFoil,
                  indent: 0,
                ),
                InkWell(
                  onTap: () {
                    ProTiendasRoute.navAddAddress();
                  },
                  child: Row(
                    children: [
                      const Gap(ProTiendaSpacing.md),
                      XigoTextCaptionS(
                        BreedUiValues.addShippingAddress,
                        color: ProTiendasUiColors.crayolaGreen,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Gap(ProTiendaSpacing.md),
          ContainerCircleColor(
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          BreedUiValues.circleGrey,
                        ),
                        const Gap(ProTiendaSpacing.sm),
                        XigoTextLarge(
                          BreedUiValues.pickUpDeliveryPoint,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                    XigoTextSmall(
                      BreedUiValues.sendFree,
                      color: ProTiendasUiColors.crayolaGreen,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
                const Divider(
                  thickness: 0.5,
                  color: ProTiendasUiColors.silverFoil,
                  indent: 0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: ProTiendaSpacing.sm,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            BreedUiValues.icUbicationDelivery,
                          ),
                          const Gap(ProTiendaSpacing.sm),
                          XigoTextCaptionS(
                            BreedUiValues.addressOffice,
                            color: ProTiendasUiColors.primaryColor,
                            weight: FontWeight.w300,
                          ),
                        ],
                      ),
                      const Gap(ProTiendaSpacing.sm),
                      Row(
                        children: [
                          SvgPicture.asset(
                            BreedUiValues.icTimeDelivery,
                          ),
                          const Gap(ProTiendaSpacing.sm),
                          XigoTextCaptionS(
                            BreedUiValues.officeHours,
                            color: ProTiendasUiColors.silverFoil,
                            weight: FontWeight.w300,
                          ),
                        ],
                      ),
                      const Gap(ProTiendaSpacing.sm),
                      XigoTextCaptionS(
                        BreedUiValues.viewMapChooseAnotherCollectionPoint,
                        color: ProTiendasUiColors.crayolaGreen,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
