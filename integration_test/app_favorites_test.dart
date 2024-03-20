import 'package:breeds/main.dart';
import 'package:patrol/patrol.dart';

void main() {
  patrolTest(
    'Test tap ListHorizontal',
    ($) async {
      await $.pumpWidgetAndSettle(const MyApp());
      await $.pumpAndSettle();

      await $('breed/2').scrollTo().tap();
      await $.pumpAndSettle();
    },
  );
}
