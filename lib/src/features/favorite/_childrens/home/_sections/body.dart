part of 'package:breeds/src/features/favorite/_childrens/home/page.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocFavorite, FavoriteState>(
      builder: (context, state) {
        if (state.model.favorites.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(BreedSpacing.xxl),
                XigoTextHeading6(
                  BreedUiValues.notFavorite,
                  weight: FontWeight.bold,
                ),
                XigoTextLarge(BreedUiValues.addFavoriteHere),
              ],
            ),
          );
        }
        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: state.model.favorites.length,
          itemBuilder: (context, index) {
            final item = state.model.favorites[index];
            return Padding(
              key: Key(item.id),
              padding: const EdgeInsets.symmetric(
                horizontal: BreedSpacing.lg,
                vertical: BreedSpacing.sm,
              ),
              child: CardProductVertical(
                breed: item,
              ),
            );
          },
        );
      },
    );
  }
}
