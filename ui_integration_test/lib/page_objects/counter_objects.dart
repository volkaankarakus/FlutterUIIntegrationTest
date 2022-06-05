import 'package:flutter/material.dart';

class CounterObjects {
  CounterObjects._init(); // closing the constructor because more than one static is used at the end.
  static const buttonToolTip = 'button_tool_tip';
  static const buttonUpdate = 'button_update';

  static const ValueKey<CounterObjectKeys> textFieldKey = ValueKey(CounterObjectKeys.updateTextField);
}

enum CounterObjectKeys {updateTextField}