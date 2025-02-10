import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/constants.dart';

class CustomField extends ConsumerWidget {
  CustomField(
      {required this.controller,
        this.hint,
        this.testKey,
        this.label,
        this.width,
        this.scroller,
        this.enabled,
        this.secure,
        this.icon,
        this.action,
        this.inputType,
        this.validator,
        this.onChanged,
        this.onFieldSubmitted,
        this.required,
        this.textAlign,
        this.focusNode,
        this.inputFormatters,
        this.maxLines});

  String? label;
  String? hint;
  String? testKey;
  TextEditingController controller;
  final String? Function(String?)? validator;
  double? width;
  Widget? icon;
  Widget? action;
  TextAlign? textAlign;
  Function(String)? onChanged;
  Function(String)? onFieldSubmitted;
  FocusNode? focusNode;
  TextInputType? inputType;
  List<TextInputFormatter>? inputFormatters;
  bool? secure;
  bool? enabled = true;
  bool? required = false;
  int? maxLines;
  ScrollController? scroller;
  final showPass = StateProvider((ref) => false);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showPassVal = ref.watch(showPass);
    return Container(
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(100)
      ),
      child: TextFormField(
        // contextMenuBuilder: (context, editableTextState) {
        //   final TextEditingValue value = editableTextState.textEditingValue;
        //   final List<ContextMenuButtonItem> buttonItems =
        //       editableTextState.contextMenuButtonItems;
        //   // if (isValidEmail(value.selection.textInside(value.text))) {
        //     buttonItems.insert(
        //         0,
        //         ContextMenuButtonItem(
        //           label: '☎️',
        //           onPressed: () {
        //             ContextMenuController.removeAny();
        //             // Navigator.of(context).push(_showDialog(context));
        //           },
        //         ));
        //   // }
        //   return AdaptiveTextSelectionToolbar.buttonItems(
        //     anchors: editableTextState.contextMenuAnchors,
        //     buttonItems: buttonItems,
        //   );
        // },
        enabled: enabled,
        focusNode: focusNode,
        textAlign: textAlign ?? TextAlign.start,
        key: testKey == null ? null : Key(testKey!),
        obscureText: secure == null
            ? false
            : (showPassVal)
            ? false
            : true,
        controller: controller,
        maxLines: maxLines ?? 1,
        keyboardType: inputType,
        validator: validator,
        onTap: () {
          if (scroller != null) {
            scroller?.animateTo(scroller!.position.maxScrollExtent,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
          }
        },
        onChanged: (val) {
          if (onChanged != null) {
            onChanged!(val);
          }
        },
        onFieldSubmitted: onFieldSubmitted,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          fillColor: Colors.white,

          labelStyle: TextStyle(color: kPrimaryColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: kPrimaryColor, width: 5.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: kPrimaryColor, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: kPrimaryColor, width: 1.0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: Colors.red, width: 1.0),
          ),
          hintText:
          hint == null ? null : (hint! + (required == true ? " *" : "")),
          prefixIcon: icon,
          suffixIcon: secure == true
              ? InkWell(
            onTap: () {
              if (showPassVal) {
                ref.read(showPass.notifier).state = false;
              } else {
                ref.read(showPass.notifier).state = true;
              }
            },
            child: Icon(
              Icons.remove_red_eye,
              color: Colors.grey,
            ),
          )
              : action,
          contentPadding: EdgeInsets.all(20),
          hintStyle:  TextStyle(
            color: Colors.black.withOpacity(0.4),
            fontSize: 13,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
