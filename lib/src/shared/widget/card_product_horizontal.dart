import 'package:breeds_widget/app/widget/imagen_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:breeds/src/shared/widget/favorite/bloc/bloc.dart';
import 'package:l10n_breeds/app/breeds_ui.dart';
import 'package:utils_breeds/utils/constant/colors.dart';
import 'package:utils_breeds/utils/constant/spacing.dart';
import 'package:utils_breeds/utils/helpers/text/text.dart';

class CardProductHorizontal extends StatelessWidget {
  const CardProductHorizontal({
    super.key,
    required this.image,
    required this.title,
    required this.priceBefore,
    required this.price,
    required this.desct,
    required this.isFreeSend,
    this.widthImage = 150,
    this.heightImage = 120,
    required this.id,
  });
  final String image;
  final String title;
  final String priceBefore;
  final String price;
  final String desct;
  final bool isFreeSend;

  final double widthImage;
  final double heightImage;
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: Modular.get<BlocFavorite>(),
      child: BlocListener<BlocFavorite, FavoriteState>(
        listener: (context, state) {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 3,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<BlocFavorite, FavoriteState>(
                  builder: (context, state) {
                    final isFavorite = state.model.favorites.contains(id);
                    return InkWell(
                      key: UniqueKey(),
                      onTap: () {
                        context
                            .read<BlocFavorite>()
                            .add(OnChangeFavoriteEvent(id: id));
                      },
                      child: SvgPicture.asset(
                        isFavorite
                            ? BreedUiValues.iconHeartSvg
                            : BreedUiValues.icHeartNoSelected,
                        height: 20,
                        width: 30,
                      ),
                    );
                  },
                ),
                Hero(
                  tag: image,
                  child: ImagenWidget(
                    image: image,
                    height: heightImage,
                    width: widthImage,
                  ),
                ),
                const Gap(ProTiendaSpacing.sl),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    XigoTextMedium(
                      title,
                      color: ProTiendasUiColors.primaryColor,
                      weight: FontWeight.w600,
                    ),
                    const Gap(ProTiendaSpacing.sm),
                    XigoTextMedium(
                      price,
                      color: ProTiendasUiColors.primaryColor,
                      weight: FontWeight.w500,
                    ),
                    const Gap(ProTiendaSpacing.sm),
                    if (isFreeSend) ...[
                      const Gap(ProTiendaSpacing.sm),
                      XigoTextMedium(
                        BreedUiValues.sendFree,
                        color: ProTiendasUiColors.secondaryColor,
                        weight: FontWeight.w500,
                      ),
                    ]
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
