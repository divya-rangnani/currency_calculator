import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({Key? key,required this.title, this.linearGradient, this.onTap})
      : super(key: key);

  final LinearGradient? linearGradient;
  final VoidCallback? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 24.0),
      child: MaterialButton(
        onPressed: onTap ?? () {},
        child: Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
          decoration: BoxDecoration(
            gradient: linearGradient,
            border: Border.all(color: Colors.blue),
            borderRadius: const BorderRadius.all(Radius.circular(25)),
          ),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline5!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}