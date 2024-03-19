import 'package:network_breeds/app/network/http_client.dart';

import 'package:breeds/src/features/home/presentation/page.dart' as home;

class HomeModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(
        Modular.initialRoute,
        child: (_, args) => const home.Page(),
        transition: TransitionType.fadeIn,
      ),
    ];
  }
}
