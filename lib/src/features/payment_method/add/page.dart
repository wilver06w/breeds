import 'package:breeds_widget/app/widget/app_bar_global.dart';
import 'package:breeds_widget/app/widget/button/btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:breeds/src/features/payment_method/add/bloc/bloc.dart';
import 'package:utils_breeds/utils/constant/colors.dart';
import 'package:utils_breeds/utils/constant/navigation.dart';
import 'package:utils_breeds/utils/constant/spacing.dart';
import 'package:utils_breeds/utils/helpers/formatter.dart';
import 'package:utils_breeds/utils/helpers/input/input.dart';
import 'package:utils_breeds/utils/helpers/text/text.dart';
import 'package:l10n_breeds/app/breeds_ui.dart';

part 'package:breeds/src/features/payment_method/add/_sections/body.dart';
part 'package:breeds/src/features/payment_method/add/_sections/form_data_tarjet.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocPaymentAdd(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarGlobal(
          onTapIcon: () {
            Modular.to.pop();
          },
          haveSearch: false,
          havCart: false,
          title: BreedUiValues.paymentMethod,
        ),
        body: const Body(),
      ),
    );
  }
}
