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
              if (state.model.listBreed.isEmpty) {
                return const SizedBox.shrink();
              }
              return const SizedBox.shrink();
              // return ViewBanner(
              //   size: size,
              //   mobile: [],
              //   // mobile: state.model.listBreed,
              // );
            },
          ),
          BlocBuilder<BlocHome, HomeState>(
            builder: (context, state) {
              if (state.model.listBreed.isEmpty) {
                return const SizedBox.shrink();
              }
              return SizedBox(
                height: 100,
                child: BlocBuilder<BlocHome, HomeState>(
                  builder: (context, state) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.model.listBreed.length,
                      itemBuilder: (context, index) {
                        final item = state.model.listBreed[index];
                        return InkWell(
                          onTap: () {
                            ProTiendasRoute.navDetail(
                              id: item.id,
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: ProTiendaSpacing.sm,
                            ),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                  backgroundImage: NetworkImage(
                                    BreedUiValues.imageUrlConcatec(
                                      item.referenceImageId ?? '',
                                    ),
                                  ),
                                ),
                                const Gap(ProTiendaSpacing.sl),
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
          const Gap(ProTiendaSpacing.sl),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: ProTiendaSpacing.md),
            child: TitleSections(
              title: BreedUiValues.theNew,
            ),
          ),
          BlocBuilder<BlocHome, HomeState>(
            builder: (context, state) {
              if (state.model.listBreed.isEmpty) {
                return const SizedBox.shrink();
              }
              return SizedBox(
                height: 270,
                child: BlocBuilder<BlocHome, HomeState>(
                  builder: (context, state) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.model.listBreed.length,
                      itemBuilder: (context, index) {
                        final item = state.model.listBreed[index];
                        return InkWell(
                          onTap: () {
                            ProTiendasRoute.navDetail(
                              id: item.id,
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: ProTiendaSpacing.xxs,
                            ),
                            margin: const EdgeInsets.only(
                                left: ProTiendaSpacing.sl),
                            child: CardProductVertical(
                              id: (index + 30),
                              adaptability: item.adaptability,
                              socialNeeds: item.socialNeeds,
                              image: BreedUiValues.imageUrlConcatec(
                                item.referenceImageId ?? '',
                              ),
                              title: item.name,
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
          const Gap(ProTiendaSpacing.lg),
          BlocBuilder<BlocHome, HomeState>(
            builder: (context, state) {
              if (state.model.listBreed.isEmpty) {
                return const SizedBox.shrink();
              }
              return GridView.builder(
                shrinkWrap: true,
                itemCount: state.model.listBreed.length,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final item = state.model.listBreed[index];
                  return InkWell(
                    onTap: () {
                      ProTiendasRoute.navDetail(
                        id: item.id,
                      );
                    },
                    child: CardImagenGrid(
                      priceBefore: '\$480.000',
                      price: '\$450.000',
                      desct: '10% Dto',
                      image: BreedUiValues.imageUrlConcatec(
                        item.referenceImageId ?? '',
                      ),
                      title: item.name,
                      isFreeSend: true,
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
