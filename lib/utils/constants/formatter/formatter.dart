// ignore_for_file: unnecessary_null_comparison

import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart';

class DateTextFormatter extends TextInputFormatter {
  static const _maxChars = 8;

  TextSelection _updateCursor(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = _format(newValue.text, '/');
    return newValue.copyWith(text: text, selection: _updateCursor(text));
  }

  String _format(String value, String seperator) {
    value = value.replaceAll(seperator, '');
    var newString = '';

    for (int i = 0; i < math.min(value.length, _maxChars); i++) {
      newString += value[i];
      if ((i == 1 || i == 3) && i != value.length - 1) {
        newString += seperator;
      }
    }
    return newString;
  }
}

class MoneyDotFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      final int selectionIndexFromTheRight =
          newValue.text.length - newValue.selection.end;
      final f = NumberFormat("#,###");
      final number =
          int.parse(newValue.text.replaceAll(f.symbols.GROUP_SEP, ''));
      final newString = f.format(number);
      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(
            offset: newString.length - selectionIndexFromTheRight),
      );
    } else {
      return newValue;
    }
  }
}

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({required this.decimalRange})
      : assert(decimalRange == null || decimalRange > 0);

  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.
    TextEditingValue newValue,
  ) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    if (decimalRange != null) {
      String value = newValue.text;
      String value2 = oldValue.text;

      if (value.contains(".") &&
          value.substring(value.indexOf(".") + 1).length > decimalRange) {
        truncated = oldValue.text;
        newSelection = oldValue.selection;
      } else if (value == ".") {
        truncated = "0.";

        newSelection = newValue.selection.copyWith(
          baseOffset: math.min(truncated.length, truncated.length + 1),
          extentOffset: math.min(truncated.length, truncated.length + 1),
        );
      } else if (value.substring(value2.length).equal(".") &&
          value2.contains(".")) {
        truncated = oldValue.text;
        newSelection = oldValue.selection;
      }

      return TextEditingValue(
        text: truncated,
        selection: newSelection,
        composing: TextRange.empty,
      );
    }
    return newValue;
  }
}

class NoLeadingZeroFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.startsWith('0') && newValue.text.length == 1) {
      return oldValue; // prevent leading zero
    }
    return newValue;
  }
}

class OnlyNWithTildeInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.contains(RegExp(r'[^\a-zA-Z ]'))) {
      // If the new value contains any characters other than 'ñ', reject it.
      return oldValue;
    } else {
      // Otherwise, allow the new value.
      return newValue;
    }
  }
}

class NumberTextInputFormatter extends TextInputFormatter {
  // This regex pattern allows only numbers, commas, and periods
  static final _pattern = RegExp(r'^[\d,\.]*$');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (_pattern.hasMatch(newValue.text)) {
      return newValue;
    } else {
      return oldValue;
    }
  }
}

class AlphaNumericTextFormatter extends TextInputFormatter {
  // Pattern that allows only alphanumeric characters
  final _pattern = RegExp(r'^[a-zA-Z0-9]+$');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Check if new value matches the pattern
    if (_pattern.hasMatch(newValue.text)) {
      // If it matches, return the new value
      return newValue;
    }
    // If it doesn't match, return the old value
    return oldValue;
  }
}

class AlphaInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.contains(RegExp(r'[^\a-zA-Z ]'))) {
      // Alpha only and no 'ñ'
      return oldValue;
    } else {
      return newValue;
    }
  }
}

class AlphaNumericNoEmojiFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.contains(RegExp(r'[^a-zA-Z0-9 ]'))) {
      return oldValue;
    } else {
      return newValue;
    }
  }
}

class NumberNoEmojiFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove emojis
    final filteredText = newValue.text.replaceAll(RegExp(r'[^\d]+'), '');
    return TextEditingValue(
      text: filteredText,
      selection: TextSelection.collapsed(offset: filteredText.length),
    );
  }
}

class WithTildeAndAlphaNumericInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.contains(RegExp(r'[^\a-zA-Z0-9 ]'))) {
      // Alphanumeric but no 'ñ'
      return oldValue;
    } else {
      // Otherwise, allow the new value.
      return newValue;
    }
  }
}

//VYBEREV24-44
class InitialInput0Into63Formatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String truncated = newValue.text;
    //if the first input is 0, will be replaced to 63
    if (newValue.text.startsWith("0")) {
      truncated = newValue.text.replaceFirst(("0"), "63");
    }
    //put the mobile cursor next to 63
    final newSelection = TextSelection.collapsed(offset: truncated.length);
    return TextEditingValue(
      text: truncated,
      selection: newSelection,
    );
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // if (newValue.selection.baseOffset == 0) {
    //   return newValue;
    // }
    String finalVal = "";
    // ignore: unused_local_variable
    int length = 0;
    if (newValue.text.trim() != "") {
      final oldBaseOffSet = oldValue.selection.baseOffset;
      final textold = oldBaseOffSet > 1 ? oldValue.text[oldBaseOffSet - 1] : '';
      if (textold == '.' &&
          _checkTotalpoint(oldValue.text) ==
              (_checkTotalpoint(newValue.text) + 1)) {
        if (oldBaseOffSet > 2) {
          final x = oldValue.text.substring(0, oldBaseOffSet - 2) +
              oldValue.text.substring(oldBaseOffSet - 1);
          finalVal = _formatIDR(x);
        } else {
          final x = oldValue.text.substring(1);
          finalVal = _formatIDR(x);
        }
      } else {
        finalVal = _formatIDR(newValue.text);
      }
    }

    int cursorPosition =
        newValue.selection.baseOffset + finalVal.length - newValue.text.length;
    cursorPosition < 0 ? cursorPosition = 0 : false;
    return newValue.copyWith(
      text: finalVal,
      selection: TextSelection.collapsed(
        offset: cursorPosition,
      ),
    );
  }
}

String _formatIDR(String input) {
  final formatter = NumberFormat("#,###");
  String x = input.replaceAll(".", "");
  bool checkZero = 0 == int.parse(x.replaceAll(RegExp('0+'), '0'));
  checkZero ? x = '0' : false;
  int intval = int.parse(x);
  return formatter.format(intval).replaceAll(",", ".");
}

int _checkTotalpoint(String input) {
  List<String> splitStr = input.split('.');
  int count = splitStr.length - 1;
  return count;
}
