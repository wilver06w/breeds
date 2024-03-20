part of 'package:breeds/src/features/detail/presentation/page.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
    required this.detailParams,
  });
  final DetailParams detailParams;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(BreedSpacing.sm),
            child: Center(
              child: CircleAvatar(
                radius: BreedResponsive.height(200),
                backgroundImage: NetworkImage(
                  BreedUiValues.imageUrlConcatec(
                    detailParams.image.isNotEmpty
                        ? detailParams.image
                        : BreedUiValues.imageCat,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: BlocBuilder<BlocDetail, DetailState>(
            builder: (context, state) {
              final data = state.model.breedDetail;
              return BodySeparated(
                  body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(BreedSpacing.sm),
                    TitleSections(
                      title: BreedUiValues.characteristics,
                    ),
                    const Gap(BreedSpacing.xs),
                    XigoTextLarge(
                      data?.description ?? '',
                      weight: FontWeight.w300,
                    ),
                    const Gap(BreedSpacing.md),
                    TitleSections(
                      title: BreedUiValues.weight,
                    ),
                    const Gap(BreedSpacing.xs),
                    ItemDescription(
                      title: BreedUiValues.imperial,
                      description: '${data?.weight.imperial}',
                    ),
                    const Gap(BreedSpacing.xs),
                    ItemDescription(
                      title: BreedUiValues.metric,
                      description: '${data?.weight.metric}',
                    ),
                    const Gap(BreedSpacing.md),
                    TitleSections(
                      title: BreedUiValues.breedEspecifications,
                    ),
                    const Gap(BreedSpacing.xs),
                    ItemDescription(
                      title: BreedUiValues.temperament,
                      description: '${data?.temperament}',
                    ),
                    const Gap(BreedSpacing.xs),
                    ItemDescription(
                      title: BreedUiValues.origin,
                      description: '${data?.origin}',
                    ),
                    const Gap(BreedSpacing.xs),
                    ItemDescription(
                      title: BreedUiValues.countryCode,
                      description: '${data?.countryCode}',
                    ),
                    const Gap(BreedSpacing.xs),
                    ItemDescription(
                      title: BreedUiValues.lifeSpan,
                      description: '${data?.lifeSpan}',
                    ),
                    const Gap(BreedSpacing.xs),
                    if ((data?.altNames ?? '').isNotEmpty) ...[
                      ItemDescription(
                        title: BreedUiValues.altNames,
                        description: '${data?.altNames}',
                      )
                    ],
                    const Gap(BreedSpacing.xs),
                    XigoTextSmall(
                      BreedUiValues.adaptability,
                      color: ProTiendasUiColors.silverFoil,
                    ),
                    StarItem(qualification: data?.adaptability ?? 0),
                    const Gap(BreedSpacing.xs),
                    XigoTextSmall(
                      BreedUiValues.affectionLevel,
                      color: ProTiendasUiColors.silverFoil,
                    ),
                    StarItem(qualification: data?.affectionLevel ?? 0),
                    const Gap(BreedSpacing.xs),
                    XigoTextSmall(
                      BreedUiValues.childFriendly,
                      color: ProTiendasUiColors.silverFoil,
                    ),
                    StarItem(qualification: data?.childFriendly ?? 0),
                    const Gap(BreedSpacing.xs),
                    XigoTextSmall(
                      BreedUiValues.dogFriendly,
                      color: ProTiendasUiColors.silverFoil,
                    ),
                    StarItem(qualification: data?.dogFriendly ?? 0),
                    const Gap(BreedSpacing.xs),
                    XigoTextSmall(
                      BreedUiValues.energyLevel,
                      color: ProTiendasUiColors.silverFoil,
                    ),
                    StarItem(qualification: data?.energyLevel ?? 0),
                    const Gap(BreedSpacing.xs),
                    XigoTextSmall(
                      BreedUiValues.grooming,
                      color: ProTiendasUiColors.silverFoil,
                    ),
                    StarItem(qualification: data?.grooming ?? 0),
                    const Gap(BreedSpacing.xs),
                    XigoTextSmall(
                      BreedUiValues.healthIssues,
                      color: ProTiendasUiColors.silverFoil,
                    ),
                    StarItem(qualification: data?.healthIssues ?? 0),
                    const Gap(BreedSpacing.xs),
                    XigoTextSmall(
                      BreedUiValues.strangerFriendly,
                      color: ProTiendasUiColors.silverFoil,
                    ),
                    StarItem(qualification: data?.strangerFriendly ?? 0),
                    const Gap(BreedSpacing.xs),
                    XigoTextSmall(
                      BreedUiValues.vocalisation,
                      color: ProTiendasUiColors.silverFoil,
                    ),
                    StarItem(qualification: data?.vocalisation ?? 0),
                    const Gap(BreedSpacing.md),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        XigoTextHeading6(
                          BreedUiValues.shareForFriend,
                          color: ProTiendasUiColors.silverFoil,
                        ),
                        const Gap(BreedSpacing.xl),
                        InkWell(
                          onTap: () {
                            Functions.sharedBreedInfo(
                                url: data?.wikipediaUrl ?? '');
                          },
                          child: const Icon(
                            Icons.share,
                            color: ProTiendasUiColors.secondaryColor,
                          ),
                        ),
                      ],
                    ),
                    const Gap(BreedSpacing.md),
                  ],
                ),
              ));
            },
          ),
        ),
      ],
    );
  }
}

class BodySeparated extends StatelessWidget {
  const BodySeparated({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: BreedSpacing.md,
      ),
      child: body,
    );
  }
}
