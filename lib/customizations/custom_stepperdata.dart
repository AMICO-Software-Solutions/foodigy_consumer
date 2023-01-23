import 'package:flutter/material.dart';

class StepperData {
  /// title for the stepper
  final StepperText? title;

  /// subtitle for the stepper
  final StepperText? subtitle;
  final StepperText? content;

  final Widget? iconWidget;

  /// Use the constructor of [StepperCustomData] to pass the data needed.
  StepperData({this.content,this.iconWidget, this.title, this.subtitle});
}

class StepperText {
  /// text for the stepper
  final String text;

  /// textStyle for stepper
  final TextStyle? textStyle;

  StepperText(this.text, {this.textStyle});
}
