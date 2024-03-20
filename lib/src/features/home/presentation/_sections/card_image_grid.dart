part of 'package:breeds/src/features/home/presentation/page.dart';

class CardImagenGrid extends StatelessWidget {
  const CardImagenGrid({
    super.key,
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: ProTiendaSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(
                image,
              ),
            ),
          ),
          const Gap(ProTiendaSpacing.sl),
          XigoTextMedium(
            title,
            color: ProTiendasUiColors.primaryColor,
            weight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
