part of 'package:breeds/src/features/auth/_childrens/login/page.dart';

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
            ProTiendasUiValues.loginWith,
            color: Colors.black,
          ),
          const Gap(ProTiendaSpacing.sl),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ItemSigInRegister(
                icRoute: ProTiendasUiValues.icGoogle,
              ),
              Gap(ProTiendaSpacing.sl),
              ItemSigInRegister(
                icRoute: ProTiendasUiValues.icFacebook,
              ),
              Gap(ProTiendaSpacing.sl),
              ItemSigInRegister(
                icRoute: ProTiendasUiValues.icIos,
              ),
              Gap(ProTiendaSpacing.sl),
              ItemSigInRegister(
                icRoute: ProTiendasUiValues.icMicrosoft,
              ),
            ],
          ),
          const Gap(ProTiendaSpacing.xl),
          XigoTextSmall(
            ProTiendasUiValues.iNeedHelpEnter,
            color: ProTiendasUiColors.secondaryColor,
            weight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
