import 'package:flutter_modular/flutter_modular.dart';
import 'package:breeds/src/features/favorite/_childrens/home/page.dart' as favorite;

class CartModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(
        Modular.initialRoute,
        child: (_, args) => const favorite.Page(),
        transition: TransitionType.fadeIn,
      ),
    ];
  }
}
