import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydropome/main.dart';

void main() {
  testWidgets('MainApp displays Hello World', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MainApp());

    // Verify that our text is displayed.
    expect(find.text('Hello World!'), findsOneWidget);
  });

  testWidgets('MainApp has MaterialApp', (WidgetTester tester) async {
    await tester.pumpWidget(const MainApp());

    // Verify that MaterialApp is present.
    expect(find.byType(MaterialApp), findsOneWidget);
  });

  testWidgets('MainApp has Scaffold', (WidgetTester tester) async {
    await tester.pumpWidget(const MainApp());

    // Verify that Scaffold is present.
    expect(find.byType(Scaffold), findsOneWidget);
  });
}


