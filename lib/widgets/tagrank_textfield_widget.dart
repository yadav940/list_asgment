import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:coco_asg/util/color/color/colors.dart';

class TagrankTexFieldWidget extends StatelessWidget {
  final String hintText;

  final TextEditingController textController;

  final Function(String data) validationFunction;

  final FocusNode focusNode;

  final FocusNode nextFocusNode;

  final TextInputAction textInputAction;

  final TextInputType keyboardType;
  final TextStyle textStyle;

  final int maxLines;

  final bool enabledStatus;

  final int maxLength;

  ///
  const TagrankTexFieldWidget(
      {this.hintText,
        this.textController,
        this.validationFunction,
        this.focusNode,
        this.nextFocusNode,
        this.textInputAction,
        this.keyboardType,
        this.maxLength,
        this.maxLines,
        this.enabledStatus,
        this.textStyle});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //keyboardType: hintText.matchAsPrefix("phone")?TextInputType.number:TextInputType.text,
      controller: textController,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      style: textStyle,
      enabled: enabledStatus ?? true,
      maxLines: maxLines ?? 1,
      maxLength: maxLength ?? null,
      onFieldSubmitted: (terms) {
        focusNode.unfocus();
        if (nextFocusNode != null)
          FocusScope.of(context).requestFocus(nextFocusNode);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        errorBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        enabledBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.black26)),
        focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(color: progressColor)),
        hintText: hintText,
        contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      ),
      validator: validationFunction,
    );
  }
}

class TagrankTexFieldWidgetDrawable extends StatelessWidget {
  final String hintText;

  final TextEditingController textController;

  final Function validationFunction;

  final bool textFieldEnabledStatus;

  final Widget suffixIcon;
  final Function onClickOfSuffix;
  final FocusNode focusNode;

  final FocusNode nextFocusNode;
  final TextStyle textStyle;

  final TextInputAction textInputAction;

  final TextInputType keyboardType;

  final int type;

  ///
  TagrankTexFieldWidgetDrawable(
      this.hintText, this.textController, this.validationFunction,
      {this.textFieldEnabledStatus,
        this.suffixIcon,
        this.onClickOfSuffix,
        this.focusNode,
        this.nextFocusNode,
        this.textInputAction,
        this.keyboardType,
        this.textStyle,
        this.type});

  @override
  Widget build(BuildContext context) => TextFormField(
      readOnly: textFieldEnabledStatus ?? false,
      controller: textController,
      onTap: () => type == null ? onClickOfSuffix() : null,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onFieldSubmitted: (terms) {
        focusNode.unfocus();
        if (nextFocusNode != null)
          FocusScope.of(context).requestFocus(nextFocusNode);
      },
      decoration: InputDecoration(
        suffixIcon: suffixIcon == null
            ? suffixIcon
            : InkWell(
          onTap: () => type != null ? onClickOfSuffix() : null,
          child: suffixIcon,
        ),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        errorBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        enabledBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.black26)),
        focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(color: progressColor)),
        hintText: hintText,
        contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      ),
      validator: validationFunction);
}

class TagrankTexFieldWidgetPrefixDrawable extends StatelessWidget {
  final String hintText;
  final IconData iconData;

  // final TextEditingController textController;

  ///
  TagrankTexFieldWidgetPrefixDrawable(
      {@required this.hintText, @required this.iconData}
      /*,this.textController*/);

  @override
  Widget build(BuildContext context) => TextFormField(
    //controller: textController,
    decoration: InputDecoration(
      suffixIcon: Icon(iconData),
      border:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      errorBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      enabledBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.black26)),
      focusedBorder:
      OutlineInputBorder(borderSide: BorderSide(color: progressColor)),
      hintText: hintText,
      contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
    ),
    validator: (data) {
      if (data.isEmpty) {
        return "Name is required";
      }
    },
  );
}
