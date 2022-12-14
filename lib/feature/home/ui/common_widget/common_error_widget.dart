import 'package:flutter/material.dart';

class CommonErrorWidget extends StatelessWidget {
  final String? errorMsg;

  const CommonErrorWidget({Key? key, this.errorMsg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Text(
        errorMsg ?? 'Something went wrong, please try again in sometime!',
        style: const TextStyle(color: Colors.redAccent,height: 1.2),
        textAlign: TextAlign.center,
      ),
    );
  }
}
