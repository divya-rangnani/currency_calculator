import 'package:currency_calculator/feature/common_widgets/common_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final Function? validator;
  final TextInputType keyboardType;
  final bool enabled;
  final bool autofocus;
  final String? title;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final Function? onChanged;
  final AutovalidateMode? autoValidateMode;
  final bool readOnly;
  final int maxLines;
  final double textFieldHeight;
  final GlobalKey<FormFieldState>? key_;
  final Widget? suffixIcon;

  const CommonTextFormField(
      {super.key,
      this.controller,
      this.validator,
      this.title,
      this.keyboardType = TextInputType.text,
      this.enabled = true,
      this.autofocus = false,
      this.hintText,
      this.inputFormatters,
      this.initialValue,
      this.onChanged,
      this.autoValidateMode,
      this.readOnly = false,
      this.maxLines = 1,
      this.key_,
      this.textFieldHeight = 12,
      this.suffixIcon});

  @override
  CommonTextFormFieldState createState() => CommonTextFormFieldState();
}

class CommonTextFormFieldState extends State<CommonTextFormField> {
  String? errorMsg;

  String? updateErrorMsg(String? val) {
    if (widget.validator != null) {
      String? result = widget.validator!(val);
      WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
            errorMsg = result;
          }));

      return result;
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 4.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.title == null
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  child: Text(
                    widget.title!,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                    textAlign: TextAlign.left,
                  ),
                ),
          TextFormField(
            key: widget.key_,
            maxLines: widget.maxLines,
            controller: widget.controller,
            initialValue: widget.initialValue,
            readOnly: widget.readOnly,
            onChanged: (text) {
              if (widget.onChanged == null) {
                return;
              } else {
                return widget.onChanged!(text);
              }
            },
            enabled: widget.enabled,
            autofocus: widget.autofocus,
            style: const TextStyle(color: Colors.white, fontSize: 16.0),
            decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  vertical: widget.textFieldHeight,
                  horizontal: 15.0,
                ),
                filled: true,
                //fillColor: Colors.blue.withOpacity(0.7),
                enabledBorder: commonBorder(),
                disabledBorder: commonBorder(),
                focusedBorder:
                    commonBorder(borderColor: Colors.blue.withOpacity(0.8)),
                hintText: widget.hintText,
                hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontSize: 16.0,
                      color: Colors.white60,
                    ),
                border: commonBorder(),
                errorStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                      height: 0,
                      color: Colors.red,
                    ),
                suffixIcon: widget.suffixIcon,
                errorText:
                    (errorMsg == null || errorMsg == "") ? errorMsg : null),
            inputFormatters: widget.inputFormatters,
            validator: (val) => updateErrorMsg(val),
            keyboardType: widget.keyboardType,

          ),
          /*(errorMsg == null || errorMsg == "")
              ? const SizedBox()
              : CommonInputErrorLabel(
                  errorMessage: "$errorMsg",
                ),*/
        ],
      ),
    );
  }
}

class CommonInputErrorLabel extends StatelessWidget {
  final String? errorMessage;

  const CommonInputErrorLabel({Key? key, this.errorMessage = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        padding: const EdgeInsets.all(8),
        child: Text(
          errorMessage!,
          style: const TextStyle(
              color: Color(0xffffffff),
              fontWeight: FontWeight.w600,
              fontFamily: "Inter-Regular_",
              fontStyle: FontStyle.normal,
              fontSize: 10.0),
        ),
      ),
    );
  }
}
