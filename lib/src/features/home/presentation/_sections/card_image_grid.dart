part of 'package:breeds/src/features/home/presentation/page.dart';

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
