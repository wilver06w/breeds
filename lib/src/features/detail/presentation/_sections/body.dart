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
            padding: const EdgeInsets.all(ProTiendaSpacing.sm),
            child: Center(
              child: CircleAvatar(
                radius: YuGiOhResponsive.height(200),
                backgroundImage: NetworkImage(
                  BreedUiValues.imageUrlConcatec(
                    detailParams.image,
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
                    const Gap(ProTiendaSpacing.sm),
                    TitleSections(
                      title: BreedUiValues.characteristics,
                    ),
                    const Gap(ProTiendaSpacing.xs),
                    XigoTextLarge(
                      data?.description ?? '',
                      weight: FontWeight.w300,
                    ),
                    const Gap(ProTiendaSpacing.md),
                    TitleSections(
                      title: BreedUiValues.weight,
                    ),
                    const Gap(ProTiendaSpacing.xs),
                    ItemDescription(
                      title: BreedUiValues.imperial,
                      description: '${data?.weight.imperial}',
                    ),
                    const Gap(ProTiendaSpacing.xs),
                    ItemDescription(
                      title: BreedUiValues.metric,
                      description: '${data?.weight.metric}',
                    ),
                    const Gap(ProTiendaSpacing.md),
                    TitleSections(
                      title: BreedUiValues.breedEspecifications,
                    ),
                    const Gap(ProTiendaSpacing.xs),
                    ItemDescription(
                      title: BreedUiValues.temperament,
                      description: '${data?.temperament}',
                    ),
                    const Gap(ProTiendaSpacing.xs),
                    ItemDescription(
                      title: BreedUiValues.origin,
                      description: '${data?.origin}',
                    ),
                    const Gap(ProTiendaSpacing.xs),
                    ItemDescription(
                      title: BreedUiValues.countryCode,
                      description: '${data?.countryCode}',
                    ),
                    const Gap(ProTiendaSpacing.xs),
                    ItemDescription(
                      title: BreedUiValues.lifeSpan,
                      description: '${data?.lifeSpan}',
                    ),
                    const Gap(ProTiendaSpacing.xs),
                    if ((data?.altNames ?? '').isNotEmpty) ...[
                      ItemDescription(
                        title: BreedUiValues.altNames,
                        description: '${data?.altNames}',
                      )
                    ],
                    const Gap(ProTiendaSpacing.xs),
                    XigoTextSmall(
                      BreedUiValues.adaptability,
                      color: ProTiendasUiColors.silverFoil,
                    ),
                    StartItem(qualification: data?.adaptability ?? 0),
                    const Gap(ProTiendaSpacing.xs),
                    XigoTextSmall(
                      BreedUiValues.affectionLevel,
                      color: ProTiendasUiColors.silverFoil,
                    ),
                    StartItem(qualification: data?.affectionLevel ?? 0),
                    const Gap(ProTiendaSpacing.xs),
                    XigoTextSmall(
                      BreedUiValues.childFriendly,
                      color: ProTiendasUiColors.silverFoil,
                    ),
                    StartItem(qualification: data?.childFriendly ?? 0),
                    const Gap(ProTiendaSpacing.xs),
                    XigoTextSmall(
                      BreedUiValues.dogFriendly,
                      color: ProTiendasUiColors.silverFoil,
                    ),
                    StartItem(qualification: data?.dogFriendly ?? 0),
                    const Gap(ProTiendaSpacing.xs),
                    XigoTextSmall(
                      BreedUiValues.energyLevel,
                      color: ProTiendasUiColors.silverFoil,
                    ),
                    StartItem(qualification: data?.energyLevel ?? 0),
                    const Gap(ProTiendaSpacing.xs),
                    XigoTextSmall(
                      BreedUiValues.grooming,
                      color: ProTiendasUiColors.silverFoil,
                    ),
                    StartItem(qualification: data?.grooming ?? 0),
                    const Gap(ProTiendaSpacing.xs),
                    XigoTextSmall(
                      BreedUiValues.healthIssues,
                      color: ProTiendasUiColors.silverFoil,
                    ),
                    StartItem(qualification: data?.healthIssues ?? 0),
                    const Gap(ProTiendaSpacing.xs),
                    XigoTextSmall(
                      BreedUiValues.strangerFriendly,
                      color: ProTiendasUiColors.silverFoil,
                    ),
                    StartItem(qualification: data?.strangerFriendly ?? 0),
                    const Gap(ProTiendaSpacing.xs),
                    XigoTextSmall(
                      BreedUiValues.vocalisation,
                      color: ProTiendasUiColors.silverFoil,
                    ),
                    StartItem(qualification: data?.vocalisation ?? 0),
                    const Gap(ProTiendaSpacing.md),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        XigoTextHeading6(
                          BreedUiValues.shareForFriend,
                          color: ProTiendasUiColors.silverFoil,
                        ),
                        const Gap(ProTiendaSpacing.xl),
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
                    const Gap(ProTiendaSpacing.md),
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
        horizontal: ProTiendaSpacing.md,
      ),
      child: body,
    );
  }
}
