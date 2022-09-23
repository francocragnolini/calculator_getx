import 'package:calculadora_get/controllers/calculator_controller.dart';
import 'package:calculadora_get/widgets/line_separator.dart';
import 'package:calculadora_get/widgets/main_result.dart';
import 'package:calculadora_get/widgets/sub_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MathResults extends StatelessWidget {
  // buscar la instancia
  final calculatorCtrl = Get.find<CalculatorController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          SubResult(text: '${calculatorCtrl.firstNumber}'),
          SubResult(text: '${calculatorCtrl.operation}'),
          SubResult(text: '${calculatorCtrl.secondNumber}'),
          LineSeparator(),
          MainResultText(text: '${calculatorCtrl.mathResult}'),
        ],
      ),
    );
  }
}
