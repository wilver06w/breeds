import 'package:flutter_modular/flutter_modular.dart';
import 'package:breeds/src/features/payment_method/home/page.dart' as payment;
import 'package:breeds/src/features/payment_method/add/page.dart' as add;

class PaymentMethodModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(
        Modular.initialRoute,
        child: (_, args) => const payment.Page(),
        transition: TransitionType.fadeIn,
      ),
      ChildRoute(
        '/add',
        child: (_, args) => const add.Page(),
        transition: TransitionType.fadeIn,
      ),
    ];
  }
}
