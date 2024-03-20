part of 'package:breeds/src/features/home/presentation/page.dart';

class SearchSeparated extends StatelessWidget {
  const SearchSeparated({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        border: const Border(
          left: BorderSide(
            color: ProTiendasUiColors.secondaryColor,
            width: 3,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: BreedSpacing.md),
      child: TextFormField(
        cursorHeight: 5,
        onChanged: (value) {
          context.read<BlocHome>().add(
                SearchBreedEvent(
                  search: value,
                ),
              );
        },
        cursorColor: ProTiendasUiColors.secondaryColor,
        decoration: InputDecoration(
          hintStyle: GoogleFonts.lato(),
          hintText: BreedUiValues.searchCatbreeds,
        ),
      ),
    );
  }
}
