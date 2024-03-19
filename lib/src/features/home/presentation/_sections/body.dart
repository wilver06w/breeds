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
              if (state.model.dataBanner == null) {
                return const SizedBox.shrink();
              }
              return ViewBanner(
                size: size,
                mobile: state.model.dataBanner?.data.mobile ?? [],
              );
            },
          ),
          BlocBuilder<BlocHome, HomeState>(
            builder: (context, state) {
              if (state.model.dataCategoria == null) {
                return const SizedBox.shrink();
              }
              return SizedBox(
                height: 100,
                child: BlocBuilder<BlocHome, HomeState>(
                  builder: (context, state) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (state.model.dataCategoria?.data ?? []).length,
                      itemBuilder: (context, index) {
                        final item =
                            (state.model.dataCategoria?.data ?? [])[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: ProTiendaSpacing.sm,
                          ),
                          child: Column(
                            children: [
                              const CircleAvatar(
                                radius: 35,
                                backgroundImage: NetworkImage(
                                  'https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg?w=360&t=st=1707431887~exp=1707432487~hmac=4f842955cc47805a82701a1de5cce2c5c3ce945c432ee45d645aeaa38e85eb98',
                                ),
                              ),
                              const Gap(ProTiendaSpacing.sl),
                              XigoTextSmall(
                                item.nombre,
                                color: ProTiendasUiColors.primaryColor,
                              ),
                            ],
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
              if (state.model.dataBanner == null) {
                return const SizedBox.shrink();
              }
              return SizedBox(
                height: 270,
                child: BlocBuilder<BlocHome, HomeState>(
                  builder: (context, state) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: ProTiendaSpacing.xxs,
                          ),
                          margin:
                              const EdgeInsets.only(left: ProTiendaSpacing.sl),
                          child: CardProductVertical(
                            id: (index + 30),
                            priceBefore: '\$480.000',
                            price: '\$450.000',
                            desct: '10% Dto',
                            image:
                                'https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg?w=360&t=st=1707431887~exp=1707432487~hmac=4f842955cc47805a82701a1de5cce2c5c3ce945c432ee45d645aeaa38e85eb98',
                            title:
                                '${BreedUiValues.balonFutbol} ${(index + 30)}',
                            isFreeSend: true,
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 20,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  ProTiendasRoute.navDetail(
                    product: '1',
                  );
                },
                child: const CardImagenGrid(
                  priceBefore: '\$480.000',
                  price: '\$450.000',
                  desct: '10% Dto',
                  image:
                      'https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg?w=360&t=st=1707431887~exp=1707432487~hmac=4f842955cc47805a82701a1de5cce2c5c3ce945c432ee45d645aeaa38e85eb98',
                  title: BreedUiValues.balonFutbol,
                  isFreeSend: true,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CardImagenGrid extends StatelessWidget {
  const CardImagenGrid({
    super.key,
    required this.image,
    required this.title,
    required this.priceBefore,
    required this.price,
    required this.desct,
    required this.isFreeSend,
  });

  final String image;
  final String title;
  final String priceBefore;
  final String price;
  final String desct;
  final bool isFreeSend;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: ProTiendaSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: image,
            child: ImagenWidget(
              image: image,
            ),
          ),
          const Gap(ProTiendaSpacing.sl),
          XigoTextMedium(
            title,
            color: ProTiendasUiColors.primaryColor,
            weight: FontWeight.w600,
          ),
          const Gap(ProTiendaSpacing.sm),
          XigoTextSmall(
            priceBefore,
            color: ProTiendasUiColors.silverFoil,
          ),
          const Gap(ProTiendaSpacing.sm),
          Row(
            children: [
              XigoTextXl(
                price,
                color: ProTiendasUiColors.primaryColor,
              ),
              const Gap(ProTiendaSpacing.sm),
              XigoTextXl(
                desct,
                color: ProTiendasUiColors.secondaryColor,
              ),
            ],
          ),
          if (isFreeSend) ...[
            const Gap(ProTiendaSpacing.sm),
            XigoTextSmall(
              BreedUiValues.sendFree,
              color: ProTiendasUiColors.secondaryColor,
            ),
          ]
        ],
      ),
    );
  }
}
