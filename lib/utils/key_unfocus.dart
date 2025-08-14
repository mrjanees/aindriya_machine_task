import 'package:flutter/cupertino.dart';

class KeyboardDismissOnTap extends StatelessWidget {
  final Widget child;

  const KeyboardDismissOnTap({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      behavior: HitTestBehavior.opaque,
      child: child,
    );
  }
}
