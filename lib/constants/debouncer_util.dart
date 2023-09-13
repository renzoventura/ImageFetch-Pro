import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:pixabay/constants/constants.dart';

class DebouncerUtil {
  Timer? _timer;

  void run(VoidCallback function) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: debouncerMilliseconds), function);
  }

  void dispose() {
    _timer?.cancel();
  }
}
