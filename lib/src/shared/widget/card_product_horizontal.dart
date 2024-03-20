import 'package:breeds/src/shared/widget/favorite/bloc/bloc.dart';
import 'package:breeds_widget/app/widget/imagen_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:l10n_breeds/app/breeds_ui.dart';
import 'package:models_breeds/app/models/breed.dart';
import 'package:utils_breeds/utils/constant/colors.dart';
import 'package:utils_breeds/utils/constant/spacing.dart';
import 'package:utils_breeds/utils/helpers/text/xigo_text.dart';

class CardProductHorizontal extends StatelessWidget {
  const CardProductHorizontal({
    super.key,
    this.widthImage = 150,
    this.heightImage = 120,
    required this.breed,
  });

  final double widthImage;
  final double heightImage;
  final Breed breed;

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
                    final isFavorite = state.model.favorites.contains(breed);

                    return InkWell(
                      key: UniqueKey(),
                      onTap: () {
                        context
                            .read<BlocFavorite>()
                            .add(OnChangeFavoriteEvent(id: breed));
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
                  tag: breed.referenceImageId ?? '',
                  child: ImagenWidget(
                    image: BreedUiValues.imageUrlConcatec(
                      breed.referenceImageId ?? '',
                    ),
                    height: heightImage,
                    width: widthImage,
                  ),
                ),
                const Gap(BreedSpacing.sl),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    XigoTextMedium(
                      breed.name,
                      color: ProTiendasUiColors.primaryColor,
                      weight: FontWeight.w600,
                    ),
                    const Gap(BreedSpacing.sm),
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
