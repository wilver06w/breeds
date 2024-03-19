part of 'package:breeds/src/features/splash/ui/page.dart';

void listener(BuildContext context, StateSplash state) {
  if (state is LoadedState) {
    ProTiendasRoute.navDashboard();
  }
}
