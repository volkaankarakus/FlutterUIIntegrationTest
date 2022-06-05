import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ui_integration_test/main.dart' as app;
import 'package:ui_integration_test/page_objects/counter_objects.dart';

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Counter View', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();
    final button = find.byTooltip(CounterObjects.buttonToolTip);

    await tester.tap(button);
    await tester.tap(button);
    await tester.tap(button);
    await tester.pumpAndSettle(Duration(seconds: 2));

    expect(find.text('Result : 3'), findsOneWidget);

  });


  group('Test for textfield', () {
    testWidgets('Success result scenario for 5', (tester)async{
      app.main();
      await tester.pumpAndSettle(); // wait to screen drawing
      final updateButton = find.bySemanticsLabel(CounterObjects.buttonUpdate);
      final updateTextField = find.byKey(CounterObjects.textFieldKey);

      tester.enterText(updateTextField,'5');
      await tester.pumpAndSettle(Duration(seconds: 1));
      await tester.tap(updateButton);
      await tester.pumpAndSettle();
      expect(find.text('Result : 5'), findsOneWidget);
    });

    testWidgets('Success failed scenario for unknown value(it should show 0', (tester)async{
      app.main();
      await tester.pumpAndSettle(); // wait to screen drawing
      final updateButton = find.bySemanticsLabel(CounterObjects.buttonUpdate);
      final updateTextField = find.byKey(CounterObjects.textFieldKey);

      tester.enterText(updateTextField,'dsfsdfsfsdf');
      await tester.pumpAndSettle(Duration(seconds: 1));
      await tester.tap(updateButton);
      await tester.pumpAndSettle();
      expect(find.text('Result : 5'), findsNothing);
    });
  });
}