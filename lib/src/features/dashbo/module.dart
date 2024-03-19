import 'package:network_breeds/app/network/http_client.dart';
import 'package:breeds/src/features/dashbo/dashboard/presentation/page.dart'
    as dashboard;
import 'package:breeds/src/features/dashbo/home/presentation/page.dart' as home;

class DashboardModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(
        Modular.initialRoute,
        child: (_, args) => const dashboard.Page(),
        transition: TransitionType.fadeIn,
      ),
      ChildRoute(
        '/home',
        child: (_, args) => const home.Page(),
        transition: TransitionType.fadeIn,
      ),
    ];
  }
}
