import 'package:flutter_modular/flutter_modular.dart';
import 'package:breeds/src/features/auth/_childrens/login/page.dart' as login;
import 'package:breeds/src/features/auth/_childrens/register/page.dart'
    as register;

class AuthModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(
        Modular.initialRoute,
        child: (_, args) => const login.Page(),
        transition: TransitionType.fadeIn,
      ),
      ChildRoute(
        '/register',
        child: (_, args) => const register.Page(),
        transition: TransitionType.fadeIn,
      ),
    ];
  }
}
