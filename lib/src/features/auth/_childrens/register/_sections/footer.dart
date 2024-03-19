part of 'package:breeds/src/features/auth/_childrens/register/page.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          XigoTextSmall(
            BreedUiValues.loginWith,
            color: Colors.black,
          ),
          const Gap(ProTiendaSpacing.sl),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ItemSigInRegister(
                icRoute: BreedUiValues.icGoogle,
              ),
              Gap(ProTiendaSpacing.sl),
              ItemSigInRegister(
                icRoute: BreedUiValues.icFacebook,
              ),
              Gap(ProTiendaSpacing.sl),
              ItemSigInRegister(
                icRoute: BreedUiValues.icIos,
              ),
              Gap(ProTiendaSpacing.sl),
              ItemSigInRegister(
                icRoute: BreedUiValues.icMicrosoft,
              ),
            ],
          ),
          const Gap(ProTiendaSpacing.xl),
          XigoTextSmall(
            BreedUiValues.iNeedHelpEnter,
            color: ProTiendasUiColors.secondaryColor,
            weight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
