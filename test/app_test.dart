import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jojos_app/main.dart';

void main() {
  testWidgets('JoJo\'s app loads correctly', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(const JoJosApp());
    
    // Wait for splash screen to load
    await tester.pump(const Duration(seconds: 1));
    
    // Verify that something renders
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}