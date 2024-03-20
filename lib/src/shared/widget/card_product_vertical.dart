import 'package:breeds_widget/app/widget/star_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:breeds/src/shared/widget/favorite/bloc/bloc.dart';
import 'package:l10n_breeds/app/breeds_ui.dart';
import 'package:models_breeds/app/models/breed.dart';
import 'package:utils_breeds/utils/constant/colors.dart';
import 'package:utils_breeds/utils/constant/spacing.dart';
import 'package:utils_breeds/utils/helpers/text/xigo_text.dart';

class CardProductVertical extends StatelessWidget {
  const CardProductVertical({
    super.key,
    required this.breed,
  });
  final Breed breed;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: Modular.get<BlocFavorite>(),
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
          padding: const EdgeInsets.all(BreedSpacing.sl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<BlocFavorite, FavoriteState>(
                builder: (context, state) {
                  final isFavorite = state.model.favorites.contains(breed);

                  return InkWell(
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
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    BreedUiValues.imageUrlConcatec(
                      (breed.referenceImageId ?? '').isNotEmpty
                          ? breed.referenceImageId ?? ''
                          : BreedUiValues.imageCat,
                    ),
                  ),
                ),
              ),
              const Gap(BreedSpacing.sl),
              XigoTextLarge(
                breed.name,
                color: ProTiendasUiColors.primaryColor,
                weight: FontWeight.w600,
              ),
              const Gap(BreedSpacing.sm),
              XigoTextSmall(
                BreedUiValues.adaptability,
                color: ProTiendasUiColors.silverFoil,
              ),
              StarItem(qualification: breed.adaptability),
              const Gap(BreedSpacing.sm),
              XigoTextSmall(
                BreedUiValues.socialNeeds,
                color: ProTiendasUiColors.silverFoil,
              ),
              StarItem(qualification: breed.socialNeeds),
            ],
          ),
        ),
      ),
    );
  }
}
