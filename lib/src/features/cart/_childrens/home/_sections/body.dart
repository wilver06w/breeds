part of 'package:breeds/src/features/cart/_childrens/home/page.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BlocBuilder<BlocFavorite, FavoriteState>(
          builder: (context, state) {
            return Column(
              children: [
                ...List.generate(state.model.favorites.length, (index) {
                  final item = state.model.favorites[index];
                  return Padding(
                    key: UniqueKey(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: ProTiendaSpacing.lg,
                      vertical: ProTiendaSpacing.sm,
                    ),
                    child: CardProductVertical(
                      breed: item,
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
