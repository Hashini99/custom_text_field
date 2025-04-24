import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final String? labelText;
  final TextInputType? textInputType;
  final double? radius;
  final bool obscureText;
  final bool? isPassword;
  final Color? fillColor;
  final Color? borderColor;
  final Color? hintColor;
  final Color? textColor;
  final double? borderWidth;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextAlign textAlign;
  final int? maxLines;
  final bool? readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextCapitalization? textCapitalization;
  final String? errorMessage;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    Key? key,
    this.controller,
    this.hint,
    this.labelText,
    this.textInputType = TextInputType.text,
    this.radius = 5,
    this.obscureText = false,
    this.isPassword = false,
    this.fillColor = Colors.white,
    this.borderColor = Colors.blue,
    this.hintColor = Colors.grey,
    this.textColor = Colors.black,
    this.borderWidth = 1.0,
    this.hintStyle,
    this.textStyle,
    this.textAlign = TextAlign.left,
    this.maxLines = 1,
    this.readOnly = false,
    this.inputFormatters,
    this.prefixIcon,
    this.suffixIcon,
    this.textCapitalization = TextCapitalization.none,
    this.errorMessage,
    this.focusNode,
    this.onChanged,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(
              widget.labelText!,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: widget.borderColor,
              ),
            ),
          ),
        ClipRRect(
          borderRadius: BorderRadius.circular(widget.radius!),
          child: TextField(
            controller: widget.controller,
            obscureText:
                widget.isPassword! ? !_isPasswordVisible : widget.obscureText,
            keyboardType: widget.textInputType,
            inputFormatters: widget.inputFormatters,
            textCapitalization:
                widget.textCapitalization ?? TextCapitalization.none,
            style:
                widget.textStyle ??
                TextStyle(color: widget.textColor, fontSize: 16),
            textAlign: widget.textAlign,
            maxLines: widget.maxLines,
            readOnly: widget.readOnly!,
            focusNode: widget.focusNode,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 12,
              ),
              filled: true,
              fillColor: widget.fillColor,
              hintText: widget.hint,
              hintStyle:
                  widget.hintStyle ??
                  TextStyle(color: widget.hintColor, fontSize: 14),
              border: _getBorder(),
              focusedBorder: _getBorder(),
              enabledBorder: _getBorder(),
              errorText: widget.errorMessage,
              prefixIcon: widget.prefixIcon,
              suffixIcon:
                  widget.isPassword!
                      ? IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: widget.hintColor,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      )
                      : widget.suffixIcon,
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _getBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: widget.borderWidth!,
        color: widget.borderColor!,
      ),
      borderRadius: BorderRadius.circular(widget.radius!),
    );
  }
}
