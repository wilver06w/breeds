import 'package:flutter_modular/flutter_modular.dart';
import 'package:network_breeds/app/network/http_client.dart';
import 'package:breeds/src/features/addresses/module.dart';
import 'package:breeds/src/features/auth/module.dart';
import 'package:breeds/src/features/cart/module.dart';
import 'package:breeds/src/features/dashbo/module.dart';
import 'package:breeds/src/features/detail/page.dart' as detail;
import 'package:breeds/src/features/splash/page.dart' as splash;
import 'package:breeds/src/features/payment_method/module.dart';

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
          product: (args.data ?? {})['product'] ?? {},
        ),
        transition: TransitionType.fadeIn,
      ),
      ModuleRoute('/dashboard', module: DashboardModule()),
      ModuleRoute('/auth', module: AuthModule()),
      ModuleRoute('/address', module: AddressesModule()),
      ModuleRoute('/payment', module: PaymentMethodModule()),
      ModuleRoute('/cart', module: CartModule()),
    ];
  }
}
