part of 'package:breeds/src/features/auth/_childrens/register/page.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final app = Modular.get<AppConfig>();
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          XigoTextField(
            controller: null,
            hintText: ProTiendasUiValues.email,
            prefixIcon: const Icon(
              Icons.email_outlined,
              color: ProTiendasUiColors.silverFoil,
            ),
            fillColor: Colors.white,
            filled: true,
            validator: (value) {
              return Validate.email(value as String)
                  ? null
                  : ProTiendasUiValues.verifyEmail;
            },
            onChanged: (value) {
              context.read<BlocRegister>().add(
                    ChangeEmailEvent(
                      email: value,
                    ),
                  );
            },
          ),
          const Gap(ProTiendaSpacing.md),
          XigoTextField(
            controller: null,
            hintText: ProTiendasUiValues.name,
            prefixIcon: const Icon(
              Icons.person,
              color: ProTiendasUiColors.silverFoil,
            ),
            fillColor: Colors.white,
            filled: true,
            validator: (value) {
              if ((value ?? '').isEmpty) {
                return '${ProTiendasUiValues.name} ${ProTiendasUiValues.onRequired}';
              }
              return null;
            },
            onChanged: (value) {
              context.read<BlocRegister>().add(
                    ChangeNameEvent(
                      name: value,
                    ),
                  );
            },
          ),
          const Gap(ProTiendaSpacing.md),
          XigoTextField(
            controller: null,
            prefixIcon: const Icon(
              Icons.phone_android,
              color: ProTiendasUiColors.silverFoil,
            ),
            hintText: '# ${ProTiendasUiValues.cellPhone}',
            maxLength: app.country.digits,
            fillColor: Colors.white,
            filled: true,
            validator: (value) {
              if (value != null) {
                if (value.length < app.country.digits!) {
                  return ProTiendasUiValues.numberPhoneNoValid;
                }
              }
              return null;
            },
            keyboardType: TextInputType.number,
            textInputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              FilteringTextInputFormatter.singleLineFormatter,
              LengthLimitingTextInputFormatter(app.country.digits),
            ],
            onChanged: (value) {
              context.read<BlocRegister>().add(
                    ChangeNumberPhone(
                      numberPhone: value,
                    ),
                  );
            },
          ),
          const Gap(ProTiendaSpacing.md),
          BlocBuilder<BlocRegister, RegisterState>(
            builder: (context, state) {
              final controllers = TextEditingController(
                text: state.model.password,
              );

              return XigoObscureInput(
                controller: controllers
                  ..selection = TextSelection.fromPosition(
                    TextPosition(
                      offset: controllers.text.length,
                    ),
                  ),
                hintText: ProTiendasUiValues.password,
                fillColor: Colors.white,
                prefixIcon: const Icon(
                  Icons.password,
                  color: ProTiendasUiColors.silverFoil,
                ),
                filled: true,
                validator: (value) {
                  if ((value ?? '').isEmpty) {
                    return '${ProTiendasUiValues.password} ${ProTiendasUiValues.onRequired}';
                  }
                  return null;
                },
                onChanged: (value) {
                  context.read<BlocRegister>().add(
                        ChangePasswordEvent(
                          password: value,
                        ),
                      );
                },
              );
            },
          ),
          const Gap(ProTiendaSpacing.md),
        ],
      ),
    );
  }
}
