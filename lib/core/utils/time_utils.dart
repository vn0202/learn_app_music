import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

String formatMillisecondsToTime(int milliseconds) {
  int totalSeconds = (milliseconds / 1000).floor();
  int minutes = totalSeconds ~/ 60;
  int seconds = totalSeconds % 60;

  String minutesStr = minutes.toString().padLeft(2, '0');
  String secondsStr = seconds.toString().padLeft(2, '0');

  return '$minutesStr:$secondsStr';
}

Future<void> speakText(
  String text, {
  String setLanguage = 'en-Us',
  VoidCallback? startHandler,
  VoidCallback? completeHandler,
  VoidCallback? cancelHandler,
  VoidCallback? pauseHandler,
  ErrorHandler? errorHandler,
}) async {
  final FlutterTts flutterTts = FlutterTts();
  await flutterTts.stop();
  await flutterTts.setLanguage(setLanguage);

  await flutterTts.setPitch(1.0);

  await flutterTts.speak(text);
  if (startHandler != null) {
    flutterTts.setStartHandler(startHandler);
  }
  if (completeHandler != null) {
    flutterTts.setCompletionHandler(completeHandler);
  }
  if (errorHandler != null) {
    flutterTts.setErrorHandler(errorHandler);
  }
  if (pauseHandler != null) {
    flutterTts.setPauseHandler(pauseHandler);
  }

  if (cancelHandler != null) {
    flutterTts.setCancelHandler(cancelHandler);
  }
}
