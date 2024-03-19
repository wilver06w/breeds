import 'package:breeds_widget/app/widget/app_bar_global.dart';
import 'package:breeds_widget/app/widget/button/btn.dart';
import 'package:breeds_widget/app/widget/imagen_widget.dart';
import 'package:breeds_widget/app/widget/item_description.dart';
import 'package:breeds_widget/app/widget/title_sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:network_breeds/app/network/http_client.dart';
import 'package:utils_breeds/utils/constant/colors.dart';
import 'package:l10n_breeds/app/breeds_ui.dart';
import 'package:utils_breeds/utils/constant/responsive.dart';
import 'package:utils_breeds/utils/constant/spacing.dart';
import 'package:utils_breeds/utils/helpers/text/text.dart';
import 'package:breeds/src/features/detail/bloc/bloc.dart';
import 'package:breeds/src/features/detail/repository.dart';
import 'package:breeds/src/shared/widget/card_product_horizontal.dart';
import 'package:breeds/src/shared/widget/card_product_vertical.dart';

part 'package:breeds/src/features/detail/_sections/body.dart';
part 'package:breeds/src/features/detail/_sections/item_card_detail.dart';

class Page extends StatelessWidget {
  const Page({
    super.key,
    required this.product,
  });

  final String product;

  @override
  Widget build(BuildContext context) {
    final xigoHttpClient = Modular.get<XigoHttpClient>();
    return BlocProvider<BlocDetail>(
      create: (context) => BlocDetail(
        repository: Repository(
          yuGiOhHttpClient: xigoHttpClient,
        ),
      )..add(LoadDataCategoriasEvent()),
      child: Scaffold(
        backgroundColor: ProTiendasUiColors.white,
        appBar: AppBarGlobal(
          onTapIcon: () {
            Modular.to.pop();
          },
        ),
        body: const SafeArea(
          child: Body(),
        ),
      ),
    );
  }
}
