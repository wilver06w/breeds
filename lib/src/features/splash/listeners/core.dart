part of 'package:breeds/src/features/splash/page.dart';

void listener(BuildContext context, bloc.State state) {
  if (state is bloc.LoadedState) {
    Future.delayed(const Duration(seconds: 2), () {
      ProTiendasRoute.navDashboard();
    });
  } else if (state is bloc.UnLoggedState) {
    Future.delayed(const Duration(seconds: 5), () {
      ProTiendasRoute.navLogin();
    });
  }
}
