import 'package:breeds/src/core/utils/constant/colors.dart';
import 'package:breeds/src/core/utils/constant/navigation.dart';
import 'package:breeds/src/core/utils/constant/protienda_ui.dart';
import 'package:breeds/src/core/utils/constant/spacing.dart';
import 'package:breeds/src/core/utils/helpers/text/text.dart';
import 'package:breeds_widget/app/widget/app_bar_global.dart';
import 'package:breeds_widget/app/widget/container_circle_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

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
        title: ProTiendasUiValues.delivery,
      ),
      body: ListView(
        padding: const EdgeInsets.all(ProTiendaSpacing.lg),
        children: [
          XigoTextHeading6(
            ProTiendasUiValues.chooseDeliveryMethod,
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
                          ProTiendasUiValues.circleGrey,
                        ),
                        const Gap(ProTiendaSpacing.sm),
                        XigoTextLarge(
                          ProTiendasUiValues.sendHome,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                    XigoTextSmall(
                      ProTiendasUiValues.sendFree,
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
                        ProTiendasUiValues.addShippingAddress,
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
                          ProTiendasUiValues.circleGrey,
                        ),
                        const Gap(ProTiendaSpacing.sm),
                        XigoTextLarge(
                          ProTiendasUiValues.pickUpDeliveryPoint,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                    XigoTextSmall(
                      ProTiendasUiValues.sendFree,
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
                            ProTiendasUiValues.icUbicationDelivery,
                          ),
                          const Gap(ProTiendaSpacing.sm),
                          XigoTextCaptionS(
                            ProTiendasUiValues.addressOffice,
                            color: ProTiendasUiColors.primaryColor,
                            weight: FontWeight.w300,
                          ),
                        ],
                      ),
                      const Gap(ProTiendaSpacing.sm),
                      Row(
                        children: [
                          SvgPicture.asset(
                            ProTiendasUiValues.icTimeDelivery,
                          ),
                          const Gap(ProTiendaSpacing.sm),
                          XigoTextCaptionS(
                            ProTiendasUiValues.officeHours,
                            color: ProTiendasUiColors.silverFoil,
                            weight: FontWeight.w300,
                          ),
                        ],
                      ),
                      const Gap(ProTiendaSpacing.sm),
                      XigoTextCaptionS(
                        ProTiendasUiValues.viewMapChooseAnotherCollectionPoint,
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
