part of 'package:breeds/src/features/dashbo/dashboard/presentation/page.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BlocDashboard, DashboardState, int>(
      selector: (state) {
        return state.model.position;
      },
      builder: (context, state) {
        switch (state) {
          case 0:
            return const home.Page();
          case 1:
            return const favorites.Page();
          case 2:
            return const notifications.Page();
          case 3:
            return const profile.Page();
          default:
            return const home.Page();
        }
      },
    );
  }
}
