import 'package:flutter/cupertino.dart';

class AppSpace extends StatelessWidget {
  final double? height;
  final double? width;

  const AppSpace({Key? key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (height != null) {
      return SizedBox(height: height);
    } else if (width != null) {
      return SizedBox(width: width);
    } else {
      return SizedBox();
    }
  }
}
