// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:breeds/main.dart';
import 'package:patrol/patrol.dart';
import 'package:breeds/main.dart' as app;

void main() {
  patrolTest(
    'counter state is the same after going to home and going back',
    ($) async {
      const app.MyApp();
      await $.pumpWidgetAndSettle(const MyApp());
      await $.pumpAndSettle();

      // await $(FloatingActionButton).tap();
      await $('breed/2').scrollTo().tap();
      await $.pumpAndSettle();

      // await $.tap(find.byKey(const Key('index/2')));

      // expect($(#counterText).text, '1');
      // await $(FloatingActionButton).tap();
      // expect($(#counterText).text, '2');

      // await $.native.openNotifications();
      // await $.native.pressBack();
    },
  );
}
