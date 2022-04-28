import 'package:bloc_mvu_app/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on increment button, verify counter', (WidgetTester tester) async {
      // start app and wait for new frame.
      app.main();
      await tester.pumpAndSettle();

      // Verify the counter starts at 0.
      expect(find.text('Count: 0'), findsOneWidget);

      // Find increment button, tap it and wait for new frame.
      final incrementButton = find.byTooltip('Increment');
      await tester.tap(incrementButton);
      await tester.pumpAndSettle();

      // Verify the counter increments by 1.
      expect(find.text('Count: 1'), findsOneWidget);

      // Find delayed button, tap it and wait for new frame.
      final delayButton = find.byTooltip('Set delayed to 42');
      await tester.tap(delayButton);
      await tester.pumpAndSettle();

      // Verify the counter ist still 1.
      expect(find.text('Count: 1'), findsOneWidget);

      // Wait for 3 seconds, wait fro new frame and expect 42
      await Future<void>.delayed(const Duration(seconds: 3), () async {
        await tester.pumpAndSettle();
        expect(find.text('Count: 42'), findsOneWidget);
      });
    });
  });
}
