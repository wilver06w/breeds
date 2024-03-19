part of 'package:breeds/src/features/payment_method/add/page.dart';

class FormDataTarjet extends StatelessWidget {
  const FormDataTarjet({
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
            borderRadius: const BorderRadius.all(
              Radius.circular(
                15,
              ),
            ),
            prefixIcon: const Icon(
              Icons.credit_card,
              color: ProTiendasUiColors.silverFoil,
            ),
            hintText: BreedUiValues.cardNumber,
            fillColor: Colors.white,
            filled: true,
            keyboardType: TextInputType.number,
            textInputFormatters: [
              MaskedTextInputFormatter(
                mask: 'xxxx xxxx xxxx xxxx',
                separator: ' ',
              ),
            ],
            validator: (value) {
              if ((value ?? '').isEmpty) {
                return '${BreedUiValues.cardNumber} ${BreedUiValues.onRequired}';
              }
              return null;
            },
            onChanged: (value) {
              context.read<BlocPaymentAdd>().add(
                    OnChangeNumberCardEvent(
                      number: value,
                    ),
                  );
            },
          ),
          const Gap(ProTiendaSpacing.sl),
          XigoTextField(
            controller: null,
            borderRadius: const BorderRadius.all(
              Radius.circular(
                15,
              ),
            ),
            hintText: BreedUiValues.cardHolderName,
            fillColor: Colors.white,
            filled: true,
            validator: (value) {
              if ((value ?? '').isEmpty) {
                return '${BreedUiValues.cardHolderName} ${BreedUiValues.onRequired}';
              }
              return null;
            },
            onChanged: (value) {
              context.read<BlocPaymentAdd>().add(
                    OnChangeHolderNameEvent(
                      name: value,
                    ),
                  );
            },
          ),
          const Gap(ProTiendaSpacing.sl),
          Row(
            children: [
              Expanded(
                child: XigoTextField(
                  controller: null,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      15,
                    ),
                  ),
                  hintText: BreedUiValues.mmAA,
                  fillColor: Colors.white,
                  filled: true,
                  keyboardType: TextInputType.number,
                  textInputFormatters: [
                    MaskedTextInputFormatter(
                      mask: 'xx/xx',
                      separator: '/',
                    ),
                  ],
                  validator: (value) {
                    if ((value ?? '').isEmpty) {
                      return '${BreedUiValues.mmAA} ${BreedUiValues.onRequired}';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    context.read<BlocPaymentAdd>().add(
                          OnChangemMaaEvent(
                            mmAA: value,
                          ),
                        );
                  },
                ),
              ),
              const Gap(ProTiendaSpacing.md),
              Expanded(
                child: XigoTextField(
                  controller: null,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      15,
                    ),
                  ),
                  hintText: BreedUiValues.cVV,
                  fillColor: Colors.white,
                  filled: true,
                  keyboardType: TextInputType.number,
                  textInputFormatters: [
                    MaskedTextInputFormatter(
                      mask: 'xxx',
                      separator: '',
                    ),
                  ],
                  validator: (value) {
                    if ((value ?? '').isEmpty) {
                      return '${BreedUiValues.cVV} ${BreedUiValues.onRequired}';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    context.read<BlocPaymentAdd>().add(
                          OnChangecVVEvent(
                            cVV: value,
                          ),
                        );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
