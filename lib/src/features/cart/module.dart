import 'package:flutter_modular/flutter_modular.dart';
import 'package:breeds/src/features/cart/_childrens/home/page.dart' as cart;

class CartModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(
        Modular.initialRoute,
        child: (_, args) => const cart.Page(),
        transition: TransitionType.fadeIn,
      ),
    ];
  }
}
