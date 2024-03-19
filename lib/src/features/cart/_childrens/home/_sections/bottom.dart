part of 'package:breeds/src/features/cart/_childrens/home/page.dart';

class Bottom extends StatelessWidget {
  const Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: ProTiendaSpacing.lg,
        vertical: ProTiendaSpacing.lg,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: ProTiendasUiColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ItemResumCart(
            left: ProTiendasUiValues.productsUnits(
              2,
            ),
            right: '\$ 4.290.000',
          ),
          const Gap(ProTiendaSpacing.sm),
          ItemResumCart(
            left: ProTiendasUiValues.shipment,
            right: '\$ 15.900',
          ),
          const Gap(ProTiendaSpacing.sm),
          ItemTotal(
            left: ProTiendasUiValues.total,
            right: '\$ 4.290.000',
          ),
          const Gap(ProTiendaSpacing.sl),
          SizedBox(
            width: double.infinity,
            child: XigoBtnPrimary(
              label: ProTiendasUiValues.continueShopping,
              backgroundColor: ProTiendasUiColors.secondaryColor,
              btnSize: XigoBtnSize.big,
              labelColor: ProTiendasUiColors.primaryColor,
              onTap: () {
                ProTiendasRoute.navAddresses();
              },
            ),
          ),
        ],
      ),
    );
  }
}
