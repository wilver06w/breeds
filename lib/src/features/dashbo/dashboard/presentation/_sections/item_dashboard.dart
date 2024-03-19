part of 'package:breeds/src/features/dashbo/dashboard/presentation/page.dart';

class ItemDashboard extends StatelessWidget {
  const ItemDashboard({
    super.key,
    required this.position,
    required this.title,
    required this.routeImage,
    required this.routeIconSelected,
    required this.onTap,
  });

  final int position;
  final String title;
  final String routeImage;
  final String routeIconSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocDashboard, DashboardState>(
      builder: (context, state) {
        final isSelected = state.model.position == position;
        return GestureDetector(
          onTap: onTap,
          child: Column(
            children: [
              SvgPicture.asset(
                isSelected ? routeIconSelected : routeImage,
              ),
              if (!isSelected) ...[
                const Gap(
                  ProTiendaSpacing.xs,
                )
              ],
              XigoTextSmall(
                title,
                color: isSelected
                    ? ProTiendasUiColors.crayolaGreen
                    : ProTiendasUiColors.philippineGray,
              ),
            ],
          ),
        );
      },
    );
  }
}
