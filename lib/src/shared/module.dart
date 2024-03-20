import 'package:flutter_modular/flutter_modular.dart';
import 'package:network_breeds/app/network/http_client.dart';
import 'package:breeds/src/features/cart/module.dart';
import 'package:breeds/src/features/home/module.dart';
import 'package:breeds/src/features/detail/presentation/page.dart' as detail;
import 'package:breeds/src/features/splash/ui/page.dart' as splash;

class GlobalModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(
        Modular.initialRoute,
        child: (_, args) => const splash.Page(),
        transition: TransitionType.fadeIn,
      ),
      ChildRoute(
        '/detail',
        child: (_, args) => detail.Page(
          product: (args.data ?? {})['id'] ?? {},
        ),
        transition: TransitionType.fadeIn,
      ),
      ModuleRoute('/home', module: HomeModule()),
      ModuleRoute('/cart', module: CartModule()),
    ];
  }
}
