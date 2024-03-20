part of 'package:breeds/src/features/cart/_childrens/home/page.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Gap(ProTiendaSpacing.md),
        BlocBuilder<BlocFavorite, FavoriteState>(
          builder: (context, state) {
            return Column(
              children: [
                ...List.generate(state.model.favorites.length, (index) {
                  final item = state.model.favorites[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: ProTiendaSpacing.lg,
                      vertical: ProTiendaSpacing.sm,
                    ),
                    child: CardProductCart(
                      quantity: 2,
                      priceBefore: '\$480.000',
                      price: '\$450.000',
                      titleFeatures: 'Color',
                      descriptionFeature: 'Arena',
                      image: BreedUiValues.imageUrlConcatec(
                        item.referenceImageId ?? '',
                      ),
                      // image:
                      //     'https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg?w=360&t=st=1707431887~exp=1707432487~hmac=4f842955cc47805a82701a1de5cce2c5c3ce945c432ee45d645aeaa38e85eb98',
                      title: 'Smart Watch para Android/iOS',
                      widthImage: 90,
                      heightImage: 90,
                    ),
                  );
                }),
              ],
            );
          },
        ),
      ],
    );
  }
}
