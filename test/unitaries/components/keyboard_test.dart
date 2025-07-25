import 'package:calculatorapp/components/keyboard.dart';
import 'package:calculatorapp/constants/domains/calculator_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../adapters/user_interface_component_pumping_adapter.dart';

void main() {
  group("Test Widget Keyboard", () {
    testWidgets("Test If Widget Is Rendered", (WidgetTester tester) async {
      await UserInterfaceComponentPumpingAdapter.pumpWidget(
          tester, const Keyboard([Text(SIMPLE_EXPRESSION)]));

      Finder viewfinderValueTextWithSimpleCalculationExpression =
          find.text(SIMPLE_EXPRESSION);

      expect(
          viewfinderValueTextWithSimpleCalculationExpression, findsOneWidget);
    });
  });
}
