import 'package:calculatorapp/components/viewfinder.dart';
import 'package:calculatorapp/constants/domains/calculator_constants.dart';
import 'package:calculatorapp/cubits/calculation_expression_cubit.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression_active_record.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression_active_record_decorator.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression_register.dart';
import 'package:calculatorapp/domains/calculator/calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../adapters/user_interface_component_pumping_adapter.dart';

void main() {
  group("Test Widget Viewfinder", () {
    late Calculator calculator;
    late CalculationExpressionActiveRecord calculationExpressionActiveRecord;

    testWidgets("Test If Widget Is Rendered", (WidgetTester tester) async {
      CalculationExpression calculationExpression =
          CalculationExpression(SIMPLE_EXPRESSION);
      CalculationExpressionRegister calculationExpressionRegister =
          CalculationExpressionRegister(calculationExpression);
      calculationExpressionActiveRecord =
          CalculationExpressionActiveRecordDecorator(
              calculationExpressionRegister);

      calculator = Calculator(calculationExpressionActiveRecord);

      await UserInterfaceComponentPumpingAdapter.pumpWidget(
          tester,
          MultiBlocProvider(providers: [
            BlocProvider(
                create: (BuildContext context) =>
                    CalculationExpressionCubit(calculator)),
          ], child: const Viewfinder(false)));

      Finder viewfinderValueText = find.text(SIMPLE_EXPRESSION);

      expect(viewfinderValueText, findsOneWidget);
    });
  });
}
