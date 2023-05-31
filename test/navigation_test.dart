import 'package:samy_app/main.dart';
import 'package:samy_app/navigation/navigation_model.dart';
import 'package:samy_app/navigation/navigation_view.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('end-to-end test', () {
    testWidgets('visit all pages', (WidgetTester tester) async {
      final pages = Page.values;

      const app = SamyApp();
      await tester.pumpWidget(app);
      await tester.pumpAndSettle();

      await until(
        isTrue: () async {
          await tester.pump();
          return find.byTooltip('Menu').evaluate().isNotEmpty;
        },
        timeout: const Duration(seconds: 10),
        timeoutMsg: 'Stuck in splashscreen?',
      );

      for (final page in pages) {
        final menu = find.byTooltip('Menu');
        final drawer = find.byKey(drawerKey);

        await tester.tap(menu);
        await tester.pumpAndSettle();

        expect(drawer, findsWidgets);
        final drawerEntry = find.descendant(of: drawer, matching: find.text(prettyName(page)));
        expect(drawerEntry, findsWidgets);

        await tester.tap(drawerEntry);
        await tester.pumpAndSettle();

        expect(find.descendant(of: find.byKey(appBarKey), matching: find.text(prettyName(page))), findsWidgets);
      }
    });
  });
}

Future<void> until({
  required Function0<Future<bool>> isTrue,
  required Duration timeout,
  required String timeoutMsg,
}) async {
  final start = DateTime.now();
  while (!(await isTrue())) {
    final compareTo = DateTime.now().difference(start).compareTo(timeout);
    if (compareTo > 0) {
      fail(timeoutMsg);
    }
    await Future<void>.delayed(const Duration(milliseconds: 100));
  }
  return;
}
