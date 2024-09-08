
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xo_game/core/constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final bool? isPassword;
  final String? hint;
  final String? label;
  final bool? enabled;
  final int? maxLines, minLines, maxLength;
  final String? obscuringCharacter, value;
  final String? Function(String?)? onValidate;
  final void Function(String?)? onChanged, onFieldSubmitted, onSaved;
  final void Function()? onEditingComplete, onTap;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixWidget, prefixIcon ,prefix;
  final IconData? icon;
  final TextInputAction? action;
  final FocusNode? focusNode;

  const CustomTextField({
    super.key,
    this.controller,
    this.isPassword,
    this.hint,
    this.label,
    this.enabled,
    this.obscuringCharacter,
    this.value,
    this.onValidate,
    this.onChanged,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onSaved,
    this.onTap,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.keyboardType,
    this.inputFormatters,
    this.suffixWidget,
    this.icon,
    this.prefixIcon,
    this.prefix,
    this.action,
    this.focusNode,
  });
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return TextFormField(
      controller: widget.controller,
      initialValue: widget.value,
      validator: widget.onValidate,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      onSaved: widget.onSaved,
      onTap: widget.onTap,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      obscureText: widget.isPassword ?? false ? obscureText : false,
      obscuringCharacter: '*',
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      enabled: widget.enabled,
      style: theme.textTheme.titleSmall!.copyWith(
        fontSize: 19,
        color: black, // الخط اللي بيكنب داخل TextFormField
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: widget.action ?? TextInputAction.done,
      focusNode: widget.focusNode,
      decoration: InputDecoration(
        fillColor: grey,
        filled: true,
        labelText:widget.label,
        labelStyle: const TextStyle(fontSize: 19, color: black),
        suffixIcon: widget.isPassword ?? false
            ? InkWell(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          
          child: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off,
            color: black,
          ),
        )
            : widget.suffixWidget,
        prefixIcon: widget.prefixIcon,
        prefix: widget.prefix ,
        
        hintText: widget.hint,
        hintStyle:  const TextStyle(fontSize: 16, color: black),
        counterText: "",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: grey,
            width: 3,
          ),
        ),
        
        // suffix: isPass widget.suffixWidget,
        contentPadding: const EdgeInsets.only(
          top: 20,
          left: 12,
          right: 12,
          bottom: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          // Border
          borderSide: const BorderSide(
            color: grey,
            width: 1,
          ),
        ),
        errorStyle: const TextStyle(color: Colors.red),
        errorMaxLines: 4,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
      ),
    );
  }
}

/*
 decoration: const InputDecoration(

                  // color TextFormField
                  fillColor: Colors.grey,
                  filled: true ,

                  // before hint text or label text
                  prefixIcon: Icon(Icons.email),

                  //hintText: "email",
                  suffixIcon: Icon(Icons.add_circle),
                  labelText: "email",

                  hintStyle: TextStyle(fontSize: 25),
                  hintMaxLines: 1,



                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2
                    )
                  )
                ),
 */