import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors_const.dart';
import 'styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String? labelText;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Icon? suffixIcon;
  final Icon? preffixIcon;
  final VoidCallback? onPressedIcon;
  final String? Function(String?)? validator;
  final String Function(String?)? onchanged;
  final void Function()? oncomplete;
  final TextEditingController controller;
  final bool read;
  final int? maxlines;
  final int? maxlength;
  final List<TextInputFormatter>? inputformat;
  final Color fillColor;
  final Color bordercolor;
  final double borderRadius;

  CustomTextFormField({
    Key? key,
    required this.hintText,
    this.labelText,
    required this.obscureText,
    this.validator,
    this.onchanged,
    required this.controller,
    this.suffixIcon,
    this.onPressedIcon,
    required this.read,
    this.preffixIcon,
    this.oncomplete,
    this.keyboardType,
    this.maxlines,
    this.maxlength,
    this.inputformat,
    this.fillColor = MyColors.whiteColor,
    this.bordercolor = MyColors.borderColor,
    this.borderRadius = 10,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputformat,
        obscureText: obscureText,
        maxLength: maxlength,
        maxLines: maxlines,
        onChanged: onchanged,
        onEditingComplete: oncomplete,
        readOnly: read,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: bordercolor, width: 0.5)),
          filled: true,
          fillColor: fillColor,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: bordercolor, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: bordercolor, width: 0.5),
          ),
          prefixIcon: preffixIcon,
          suffixIcon: suffixIcon,
          disabledBorder: InputBorder.none,
          hintText: hintText,
          hintStyle: Styles.textStyleMedium(color: MyColors.hintTextColor),
          contentPadding: const EdgeInsets.all(10),
        ),
        style: Styles.textStyleMedium(),
      ),
    );
  }
}

class CustomTextFormField1 extends StatelessWidget {
  final String? labelText;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Icon? suffixIcon;
  final Icon? preffixIcon;
  final VoidCallback? onPressedIcon;
  final String? Function(String?)? validator;
  final String Function(String?)? onchanged;
  final void Function()? oncomplete;
  final TextEditingController controller;
  final bool read;
  final int? maxlines;
  final int? maxlength;
  final List<TextInputFormatter>? inputformat;
  final Color fillColor;
  final double borderRadius;

  CustomTextFormField1({
    Key? key,
    required this.hintText,
    this.labelText,
    required this.obscureText,
    this.validator,
    this.onchanged,
    required this.controller,
    this.suffixIcon,
    this.onPressedIcon,
    required this.read,
    this.preffixIcon,
    this.oncomplete,
    this.keyboardType,
    this.maxlines,
    this.maxlength,
    this.inputformat,
    this.fillColor = MyColors.whiteColor,
    this.borderRadius = 10,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputformat,
        obscureText: obscureText,
        maxLength: maxlength,
        maxLines: maxlines,
        onChanged: onchanged,
        onEditingComplete: oncomplete,
        readOnly: read,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide:
                  const BorderSide(color: MyColors.borderColor, width: 0.5)),
          filled: true,
          fillColor: fillColor,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide:
                const BorderSide(color: MyColors.borderColor, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide:
                const BorderSide(color: MyColors.borderColor, width: 0.5),
          ),
          prefixIcon: preffixIcon,
          suffixIcon: suffixIcon,
          disabledBorder: InputBorder.none,
          hintText: hintText,
          hintStyle: Styles.textStyleMedium(color: MyColors.hintTextColor),
          contentPadding: const EdgeInsets.all(10),
        ),
        style: Styles.textStyleMedium(),
      ),
    );
  }
}

class CustomTextFormField2 extends StatelessWidget {
  final String? labelText;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final Icon? preffixIcon;
  final VoidCallback? onPressedIcon;
  final String? Function(String?)? validator;
  final String Function(String?)? onchanged;
  final void Function()? oncomplete;
  final TextEditingController controller;
  final bool read;
  final int? maxlines;
  final int? maxlength;
  final List<TextInputFormatter>? inputformat;
  final Color fillColor;
  final Color bordercolor;
  final double borderRadius;
  final double hintFontSize;

  CustomTextFormField2({
    Key? key,
    required this.hintText,
    this.labelText,
    required this.obscureText,
    this.validator,
    this.onchanged,
    required this.controller,
    this.suffixIcon,
    this.onPressedIcon,
    required this.read,
    this.preffixIcon,
    this.oncomplete,
    this.keyboardType = TextInputType.text,
    this.maxlines,
    this.maxlength,
    this.inputformat,
    this.fillColor = MyColors.whiteColor,
    this.bordercolor = MyColors.borderColor,
    this.borderRadius = 10,
    this.hintFontSize = 13,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputformat,
        obscureText: obscureText,
        maxLength: maxlength,
        maxLines: maxlines,
        onChanged: onchanged,
        onEditingComplete: oncomplete,
        readOnly: read,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: bordercolor, width: 1)),
          filled: true,
          fillColor: fillColor,
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: bordercolor, width: 1),
          ),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: bordercolor, width: 1),
          ),
          prefixIcon: preffixIcon,
          suffixIcon: suffixIcon,
          disabledBorder: InputBorder.none,
          hintText: hintText,
          hintStyle: Styles.textStyleSmall(color: MyColors.hintTextColor)
              .copyWith(fontSize: hintFontSize),
          contentPadding: const EdgeInsets.all(10),
        ),
        style: Styles.textStyleMedium(color: MyColors.blackColor),
      ),
    );
  }
}

class CustomTextFormField3 extends StatelessWidget {
  final String? labelText;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Icon? suffixIcon;
  final Icon? preffixIcon;
  final VoidCallback? onPressedIcon;
  final String? Function(String?)? validator;
  final String Function(String?)? onchanged;
  final void Function()? oncomplete;
  final String Function(String?)? onfieldcomplete;
  final TextEditingController controller;
  final FocusNode? focusnode;
  final bool read;
  final int? maxlines;
  final int? maxlength;
  final List<TextInputFormatter>? inputformat;
  final Color fillColor;
  final Color bordercolor;
  final double borderRadius;

  CustomTextFormField3({
    Key? key,
    required this.hintText,
    this.labelText,
    required this.obscureText,
    this.validator,
    this.onchanged,
    required this.controller,
    this.focusnode,
    this.suffixIcon,
    this.onPressedIcon,
    required this.read,
    this.preffixIcon,
    this.oncomplete,
    this.onfieldcomplete,
    this.keyboardType,
    this.maxlines,
    this.maxlength,
    this.inputformat,
    this.fillColor = MyColors.whiteColor,
    this.bordercolor = MyColors.borderColor,
    this.borderRadius = 10,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        validator: validator,
        controller: controller,
        focusNode: focusnode,
        keyboardType: keyboardType,
        inputFormatters: inputformat,
        obscureText: obscureText,
        maxLength: maxlength,
        maxLines: maxlines,
        onChanged: onchanged,
        onEditingComplete: oncomplete,
        onFieldSubmitted: onfieldcomplete,
        readOnly: read,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: bordercolor, width: 0.5)),
          filled: true,
          fillColor: fillColor,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: bordercolor, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: bordercolor, width: 0.5),
          ),
          prefixIcon: preffixIcon,
          suffixIcon: suffixIcon,
          disabledBorder: InputBorder.none,
          hintText: hintText,
          hintStyle: Styles.textStyleMedium(color: MyColors.hintTextColor),
          contentPadding: const EdgeInsets.only(left: 10),
        ),
        style: Styles.textStyleSmall(),
      ),
    );
  }
}




// TextFormField(
//         validator: validator,
//         maxLength: maxlength,
//         controller: controller,
//         keyboardType: keyboardType,
//         inputFormatters: inputformat,
//         onSaved: onSaved,
//         onEditingComplete: oncomplete,
//         maxLines: maxlines,
//         obscureText: obscureText!,
//         readOnly: read,
//         decoration: InputDecoration(
//           hintText: hintText,
//           hintStyle: Styles.textStyleMedium(color: MyColors.hintTextColor),
//           labelText: labelText,
//           suffixIcon: suffixIcon,
//           prefixIcon: preffixIcon,
//           isDense: true,
//           errorText: errorText,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide.none,
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide.none,
//           ),
//         ),
//       ),