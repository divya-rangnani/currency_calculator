import 'package:flutter/material.dart';

class CommonDropDown extends StatelessWidget {
  final String? value;
  final String? hintText;
  final List<DropdownMenuItem<String>>? items;
  final void Function(String?)? onChanged;
  final bool isSuffix;

  const CommonDropDown(
      {required this.value,
      this.hintText,
      required this.items,
      required this.onChanged,
      this.isSuffix = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isSuffix ? MediaQuery.of(context).size.width * 0.25 : null,
      child: InputDecorator(
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          focusedBorder: commonBorder(),
          enabledBorder: commonBorder(),
          border: const OutlineInputBorder(),
          isCollapsed: true,
        ),
        child: DropdownButton<String>(
          value: value,
          hint: Text(
            hintText ?? 'Select an Option',
            style: const TextStyle(color: Colors.white54),
          ),
          disabledHint: Text(
            hintText ?? 'Select an Option',
            style: const TextStyle(color: Colors.white54),
          ),
          underline: const SizedBox(),
          isExpanded: true,
          style: const TextStyle(color: Colors.white, fontSize: 16.0),
          items: items,
          onChanged: onChanged,
          dropdownColor: Colors.blue,
          autofocus: true,
          //elevation: isSuffix?0:8,
        ),
      ),
    );
  }
}

OutlineInputBorder commonBorder({Color? borderColor}) {
  return OutlineInputBorder(
      borderSide: BorderSide(color: borderColor ?? Colors.white60, width: 1.5),
      borderRadius: const BorderRadius.all(Radius.circular(15.0)));
}
