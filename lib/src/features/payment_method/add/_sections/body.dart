part of 'package:breeds/src/features/payment_method/add/page.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formDataTarjet = GlobalKey<FormState>();
    return ListView(
      padding: const EdgeInsets.all(ProTiendaSpacing.lg),
      children: [
        const Gap(ProTiendaSpacing.lg),
        BlocBuilder<BlocPaymentAdd, PaymentAddState>(
          builder: (context, state) {
            return Center(
              child: Stack(
                children: [
                  Image.asset(ProTiendasUiValues.icBackgroundTarjet),
                  Positioned(
                    top: 40,
                    left: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: XigoTextCustom(
                                state.model.cVV,
                                color: ProTiendasUiColors.white,
                                fontStyle: GoogleFonts.lato().fontStyle,
                                letterSpacing: 2,
                                fontSize: 18,
                                textOverflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Image.asset(state.model.imageIcSelected),
                          ],
                        ),
                        XigoTextCustom(
                          state.model.mmAA,
                          color: ProTiendasUiColors.white,
                          fontStyle: GoogleFonts.lato().fontStyle,
                          letterSpacing: 2,
                          fontSize: 14,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                        XigoTextCustom(
                          state.model.name,
                          color: ProTiendasUiColors.white,
                          fontStyle: GoogleFonts.lato().fontStyle,
                          letterSpacing: 2,
                          fontSize: 18,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    left: 20,
                    right: 20,
                    child: XigoTextCustom(
                      state.model.numberCard,
                      color: ProTiendasUiColors.white,
                      fontStyle: GoogleFonts.lato().fontStyle,
                      letterSpacing: 2,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        const Gap(ProTiendaSpacing.lg),
        FormDataTarjet(formKey: formDataTarjet),
        SwitchListTile(
          value: true,
          activeColor: ProTiendasUiColors.primaryColor,
          title: XigoTextCaptionS(
            ProTiendasUiValues.saveShippingAddress,
            color: ProTiendasUiColors.primaryColor,
            weight: FontWeight.w300,
          ),
          onChanged: (value) {},
        ),
        const Gap(ProTiendaSpacing.xxl),
        BlocBuilder<BlocPaymentAdd, PaymentAddState>(
          builder: (context, state) {
            bool isFormValidate = state.model.isFormFilled;

            return XigoBtnPrimary(
              label: ProTiendasUiValues.saveConfirm,
              backgroundColor: ProTiendasUiColors.secondaryColor,
              btnSize: XigoBtnSize.big,
              labelColor: ProTiendasUiColors.primaryColor,
              onTap: isFormValidate
                  ? () {
                      ProTiendasRoute.navCartResum();
                    }
                  : null,
            );
          },
        ),
      ],
    );
  }
}
