import 'package:flutter/material.dart';
import '/utils/constants.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String? labelText;
  final bool isPassword;
  final Function(String)? onChanged;
  final int? lines;
  final String? Function(String?)? validator;
  final bool isReadOnly;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final Function()? onTap;
  final Widget? prefixIcon;
  final TextAlign textAlign;
  final bool isDense;

  const CustomTextField({
    this.hintText = "",
    this.labelText,
    this.isPassword = false,
    Key? key,
    this.onChanged,
    this.lines,
    this.isReadOnly = false,
    this.controller,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.onTap,
    this.prefixIcon,
    this.textAlign = TextAlign.start,
    this.isDense = true,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  //
  bool _isHidden = false;

  //
  @override
  void initState() {
    _isHidden = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _isHidden,
      readOnly: widget.isReadOnly,
      onChanged: widget.onChanged,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      onTap: widget.onTap,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      minLines: widget.lines ?? 1,
      maxLines: widget.lines ?? 1,
      textInputAction: widget.textInputAction,
      textAlign: widget.textAlign,
      decoration: InputDecoration(
        isDense: widget.isDense,
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: Const.kPrimary),
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(_isHidden ? Icons.visibility : Icons.visibility_off),
                onPressed: () => setState(() => _isHidden = !_isHidden))
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        alignLabelWithHint: true,
      ),
    );
  }
}
