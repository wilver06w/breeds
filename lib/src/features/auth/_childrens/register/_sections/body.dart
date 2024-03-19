part of 'package:breeds/src/features/auth/_childrens/register/page.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formKeyLogin = GlobalKey<FormState>();
    return ListView(
      padding: const EdgeInsets.all(
        ProTiendaSpacing.md,
      ),
      children: [
        const Gap(ProTiendaSpacing.xl),
        XigoTextCustom(
          ProTiendasUiValues.almostThere,
          color: ProTiendasUiColors.primaryColor,
          fontSize: 22,
        ),
        const Gap(ProTiendaSpacing.sm),
        XigoTextXl(
          ProTiendasUiValues.completeDetailsCreateAccount,
          color: Colors.black,
        ),
        const Gap(ProTiendaSpacing.md),
        FormLogin(
          formKey: formKeyLogin,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: ProTiendaSpacing.md),
          child: BlocBuilder<BlocRegister, RegisterState>(
            builder: (context, state) {
              bool isFormValidate = state.model.isFormFilledLogin;
              return XigoBtnPrimary(
                backgroundColor: ProTiendasUiColors.secondaryColor,
                labelColor: ProTiendasUiColors.primaryColor,
                onTap: isFormValidate
                    ? () {
                        final formState = formKeyLogin.currentState;

                        if (isFormValidate && (formState?.validate() ?? true)) {
                          context.read<BlocRegister>().add(SendRegisterEvent());
                        } else {
                          showToast(
                            ProTiendasUiValues.completeTheData,
                            backgroundColor: ProTiendasUiColors.rybBlue,
                            textStyle: const TextStyle(
                              color: Colors.white,
                            ),
                          );
                          return;
                        }
                      }
                    : null,
                label: ProTiendasUiValues.createAccount,
              );
            },
          ),
        ),
        const Gap(ProTiendaSpacing.xxl),
        const Footer(),
      ],
    );
  }
}
