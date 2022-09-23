import 'package:calculadora_get/widgets/math_results.dart';
import 'package:get/get.dart';

class CalculatorController extends GetxController {
  // 1 forma de hacerlo
  // RxString firstNumber = "10".obs;
  // RxString secondNumber = "20".obs;
  // RxString mathResult = "30".obs;
  // RxString operation = "+".obs;

  // 2 forma de hacerlo
  var firstNumber = "10".obs;
  var secondNumber = "20".obs;
  var mathResult = "30".obs;
  var operation = "+".obs;

  // metodos
  resetAll() {
    // opcion 1:firstNumber = "0".obs;
    //opcion 2:firstNumber.value = "0";
    firstNumber.value = "0";
    secondNumber.value = "0";
    mathResult.value = "0";
    operation.value = "+";
  }

  changeNegativePositive() {
    if (mathResult.startsWith("-")) {
      mathResult.value = mathResult.value.replaceFirst("-", "");
    } else {
      mathResult.value = "-" + mathResult.value;
    }
  }

  addNumber(String number) {
    if (mathResult.value == "0") {
      return mathResult.value = number;
    }

    //TODO: numero negativos
    if (mathResult.value == "-0") {
      return mathResult.value = "-" + number;
    }

    // no esta sumandolo, lo esta concatenando
    return mathResult.value = mathResult.value + number;
  }

  addDecimalPoint() {
    if (mathResult.contains(".")) {
      return;
    }

    if (mathResult.startsWith("0")) {
      mathResult.value = "0.";
    } else {
      mathResult.value = mathResult.value + ".";
    }
  }

  selectOperation(String newOperation) {
    operation.value = newOperation;
    firstNumber.value = mathResult.value;
    mathResult.value = "0";
  }

  deleteLastEntry() {
    if (mathResult.value.replaceAll("-", "").length > 1) {
      mathResult.value =
          mathResult.value.substring(0, mathResult.value.length - 1);
    } else {
      mathResult.value = "0";
    }
  }

  calculateResult() {
    double num1 = double.parse(firstNumber.value);
    double num2 = double.parse(mathResult.value);

    secondNumber.value = mathResult.value;

    switch (operation.value) {
      case "+":
        mathResult.value = "${num1 + num2}";
        break;

      case "-":
        mathResult.value = "${num1 - num2}";
        break;

      case "/":
        mathResult.value = "${num1 / num2}";
        break;

      case "X":
        mathResult.value = "${num2 * num1}";
        break;
      default:
        return;
    }

    if (mathResult.value.endsWith(".0")) {
      mathResult.value =
          mathResult.value.substring(0, mathResult.value.length - 2);
    }
  }
}
