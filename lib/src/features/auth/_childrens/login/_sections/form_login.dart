part of 'package:breeds/src/features/auth/_childrens/login/page.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
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
              context.read<BlocLogin>().add(
                    ChangeEmailEvent(
                      email: value,
                    ),
                  );
            },
          ),
          const Gap(ProTiendaSpacing.lg),
          BlocBuilder<BlocLogin, LoginState>(
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
                prefixIcon: const Icon(
                  Icons.password,
                  color: ProTiendasUiColors.silverFoil,
                ),
                fillColor: Colors.white,
                filled: true,
                validator: (value) {
                  if ((value ?? '').isEmpty) {
                    return '${ProTiendasUiValues.password} ${ProTiendasUiValues.onRequired}';
                  }
                  return null;
                },
                onChanged: (value) {
                  context.read<BlocLogin>().add(
                        ChangePasswordEvent(
                          password: value,
                        ),
                      );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
