import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get paddingBottomForButton {
    final bottom = MediaQuery.of(this).viewPadding.bottom;
    if (bottom > 0) {
      return bottom + 16;
    }
    return 16;
  }

  double get screenHeight {
    return MediaQuery.of(this).size.height;
  }

  double get screenWidth {
    return MediaQuery.of(this).size.width;
  }

  double getKeyboardHeight({double height = 250}) {
    final focus = MediaQuery.of(this).viewInsets.bottom;
    return focus == 0 ? height : (focus + 50);
  }

  double get getStatusBarPadding {
    return MediaQuery.of(this).padding.top;
  }
}
