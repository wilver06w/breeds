part of 'package:breeds/src/features/home/presentation/page.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<BlocHome, HomeState>(
            builder: (context, state) {
              if (state.model.getListArchetypeFilter.isEmpty) {
                return const SizedBox.shrink();
              }
              return ViewBanner(
                size: size,
                mobile: state.model.getListArchetypeFilter,
                onFuntion: (value) {
                  ProTiendasRoute.navDetail(
                    detailParams: DetailParams(
                      breed: value.breed,
                      id: value.id,
                      name: value.name,
                      image: value.image,
                    ),
                  );
                },
              );
            },
          ),
          const Gap(BreedSpacing.md),
          BlocBuilder<BlocHome, HomeState>(
            builder: (context, state) {
              if (state.model.getListArchetypeFilter.isEmpty) {
                return const SizedBox.shrink();
              }
              return SizedBox(
                height: 100,
                child: BlocBuilder<BlocHome, HomeState>(
                  builder: (context, state) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.model.getListArchetypeFilter.length,
                      itemBuilder: (context, index) {
                        final item = state.model.getListArchetypeFilter[index];
                        return InkWell(
                          key: Key('breed/{$index}'),
                          onTap: () {
                            ProTiendasRoute.navDetail(
                              detailParams: DetailParams(
                                breed: item,
                                id: item.id,
                                name: item.name,
                                image: item.referenceImageId ?? '',
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: BreedSpacing.sm,
                            ),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                  backgroundImage: NetworkImage(
                                    BreedUiValues.imageUrlConcatec(
                                      (item.referenceImageId ?? '').isNotEmpty
                                          ? item.referenceImageId ?? ''
                                          : BreedUiValues.imageCat,
                                    ),
                                  ),
                                ),
                                const Gap(BreedSpacing.sl),
                                XigoTextSmall(
                                  item.name,
                                  color: ProTiendasUiColors.primaryColor,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
          const Gap(BreedSpacing.sl),
          BlocBuilder<BlocHome, HomeState>(
            builder: (context, state) {
              if (state.model.getListArchetypeFilter.isEmpty) {
                return const SizedBox.shrink();
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: BreedSpacing.md),
                    child: TitleSections(
                      title: BreedUiValues.theNew,
                    ),
                  ),
                  SizedBox(
                    height: 260,
                    child: BlocBuilder<BlocHome, HomeState>(
                      builder: (context, state) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.model.getListArchetypeFilter.length,
                          itemBuilder: (context, index) {
                            final item =
                                state.model.getListArchetypeFilter[index];
                            return InkWell(
                              key: Key(item.id),
                              onTap: () {
                                ProTiendasRoute.navDetail(
                                  detailParams: DetailParams(
                                    breed: item,
                                    id: item.id,
                                    name: item.name,
                                    image: item.referenceImageId ?? '',
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: BreedSpacing.xxs,
                                ),
                                margin: const EdgeInsets.only(
                                    left: BreedSpacing.sl),
                                child: CardProductVertical(
                                  breed: item,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
          const Gap(BreedSpacing.lg),
          BlocBuilder<BlocHome, HomeState>(
            builder: (context, state) {
              if (state.model.getListArchetypeFilter.isEmpty) {
                return const SizedBox.shrink();
              }
              return GridView.builder(
                shrinkWrap: true,
                itemCount: state.model.getListArchetypeFilter.length,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final item = state.model.getListArchetypeFilter[index];
                  return InkWell(
                    onTap: () {
                      ProTiendasRoute.navDetail(
                        detailParams: DetailParams(
                          breed: item,
                          id: item.id,
                          name: item.name,
                          image: item.referenceImageId ?? '',
                        ),
                      );
                    },
                    child: CardImagenGrid(
                      image: BreedUiValues.imageUrlConcatec(
                        (item.referenceImageId ?? '').isNotEmpty
                            ? item.referenceImageId ?? ''
                            : BreedUiValues.imageCat,
                      ),
                      title: item.name,
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
