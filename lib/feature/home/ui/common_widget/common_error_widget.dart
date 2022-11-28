import 'package:flutter/material.dart';

class CommonErrorWidget extends StatelessWidget {
  final String? errorMsg;

  const CommonErrorWidget({Key? key, this.errorMsg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      errorMsg ?? 'Something went wrong, please try again in sometime!',
      style: const TextStyle(color: Colors.redAccent),
      textAlign: TextAlign.center,
    );
  }
}
