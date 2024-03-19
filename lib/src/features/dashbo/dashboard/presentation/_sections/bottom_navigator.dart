part of 'package:breeds/src/features/dashbo/dashboard/presentation/page.dart';

class BottomNavigator extends StatelessWidget {
  const BottomNavigator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: ProTiendaSpacing.sl,
        vertical: ProTiendaSpacing.sl,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: ProTiendasUiColors.cultured,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ItemDashboard(
                position: 0,
                onTap: () {
                  context.read<BlocDashboard>().add(
                        const ChangePositionEvent(
                          position: 0,
                        ),
                      );
                },
                title: ProTiendasUiValues.start,
                routeImage: ProTiendasUiValues.icHome,
                routeIconSelected: ProTiendasUiValues.icHomeSelected,
              ),
              ItemDashboard(
                position: 1,
                onTap: () {
                  context.read<BlocDashboard>().add(
                        const ChangePositionEvent(
                          position: 1,
                        ),
                      );
                },
                title: ProTiendasUiValues.favorites,
                routeImage: ProTiendasUiValues.icHeartNoSelectDashb,
                routeIconSelected: ProTiendasUiValues.icFavoriteSelected,
              ),
              ItemDashboard(
                position: 2,
                onTap: () {
                  context.read<BlocDashboard>().add(
                        const ChangePositionEvent(
                          position: 2,
                        ),
                      );
                },
                title: ProTiendasUiValues.notifications,
                routeImage: ProTiendasUiValues.icBells,
                routeIconSelected: ProTiendasUiValues.icNotificationSelected,
              ),
              ItemDashboard(
                position: 3,
                onTap: () {
                  context.read<BlocDashboard>().add(
                        const ChangePositionEvent(
                          position: 3,
                        ),
                      );
                },
                title: ProTiendasUiValues.myProfile,
                routeImage: ProTiendasUiValues.icMyProfile,
                routeIconSelected: ProTiendasUiValues.icProfileSelected,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
