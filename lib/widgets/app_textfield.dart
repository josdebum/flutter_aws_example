

import 'package:flutter/material.dart';
import 'package:flutter_aws_project/widgets/color_constants.dart';
import 'package:flutter_aws_project/widgets/widget_extension.dart';

class AppTextField extends StatelessWidget {
  final bool? autofocus;
  final bool? readOnly;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?)? validator;
  final double borderRadius;
  final TextInputType? keyboardType;
  final String? hintText;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final bool hasBorder;
  final bool isSearch;
  final Color? fillColor;
  final int? maxLines;
  final bool? enabled;
  final String title;
  final void Function()? onTap;
  final double contentPadding;
  final String? initialValue;
  final TextStyle style;

  const AppTextField({
    Key? key,
    this.autofocus,
    this.readOnly,
    this.autovalidateMode,
    this.validator,
    this.borderRadius = 12,
    this.keyboardType,
    this.hintText,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.controller,
    this.focusNode,
    this.onFieldSubmitted,
    this.hasBorder = true,
    this.isSearch = false,
    this.fillColor = Colors.transparent,
    this.maxLines = 1,
    this.enabled,
    this.onTap,
    required this.title,
    this.contentPadding = 0,
    this.initialValue,
    this.style = const TextStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return   Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Visibility(
        visible: hasBorder,
        child: Text(
          title,
          style: const TextStyle(
            //color: AppColors.getColorFromHex('3A4150'),
            fontSize: 14,
            fontWeight: FontWeight.w500
          ),
        ),
      ).addHeight(10),

          TextFormField(
        autofocus: autofocus ?? false,
        readOnly: readOnly ?? false,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        //obscuringCharacter: '●',
        initialValue: initialValue,
        controller: controller,
        focusNode: focusNode,
        keyboardType: keyboardType,
        autovalidateMode:
        autovalidateMode ?? AutovalidateMode.onUserInteraction,
        validator: validator,
        obscureText: obscureText,
        onFieldSubmitted: onFieldSubmitted,
        onTap: onTap,
        maxLines: maxLines,
        enabled: enabled,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(width: 1, color: kPrimary),
          ),
          isDense: true,
          fillColor: isDarkMode ? kFillBlack: kWhite,
          filled: true,
          contentPadding: EdgeInsets.all(
            hasBorder
                ? 16
                : isSearch
                ? 16
                : contentPadding,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          suffixIcon: suffixIcon != null
              ? UnconstrainedBox(
            alignment: hasBorder ? Alignment.center : Alignment.center,
            child: suffixIcon,
          )
              : null,
          prefixIcon: prefixIcon != null
              ? UnconstrainedBox(
            alignment: hasBorder
                ? Alignment.center
                : isSearch
                ? Alignment.center
                : Alignment.topCenter,
            child: prefixIcon,
          )
              : null,
          border: hasBorder
              ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(),
          )
              : isSearch
              ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,
          )
              : OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,
          ),
          errorBorder: hasBorder
              ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            //borderSide: const BorderSide(color: kSecondary),
          )
              : isSearch
              ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,
          )
              : InputBorder.none,
        ),
        onChanged: onChanged,
      ),
    ]);
  }
}