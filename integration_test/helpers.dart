import 'package:department_and_product/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> startApp(WidgetTester tester) async {
  WidgetsFlutterBinding.ensureInitialized();

  await tester.pumpWidget(
    const ProviderScope(
      child: App(),
    ),
  );

  await tester.pumpAndSettle();
}
