import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  // Controller for managing the text input.
  final TextEditingController? controller;

  // Placeholder text displayed inside the text field.
  final String? hint;

  // Label text displayed above the text field.
  final String? labelText;

  // Type of keyboard to use for text input.
  final TextInputType? textInputType;

  // Border radius for the text field.
  final double? radius;

  // Whether to obscure the text (e.g., for passwords).
  final bool obscureText;

  // Indicates if the text field is a password field.
  final bool? isPassword;

  // Background color of the text field.
  final Color? fillColor;

  // Border color of the text field.
  final Color? borderColor;

  // Color of the hint text.
  final Color? hintColor;

  // Color of the input text.
  final Color? textColor;

  // Width of the border.
  final double? borderWidth;

  // Style for the hint text.
  final TextStyle? hintStyle;

  // Style for the input text.
  final TextStyle? textStyle;

  // Alignment of the text inside the text field.
  final TextAlign textAlign;

  // Maximum number of lines for the text field.
  final int? maxLines;

  // Whether the text field is read-only.
  final bool? readOnly;

  // Input formatters for controlling the input.
  final List<TextInputFormatter>? inputFormatters;

  // Widget displayed at the start of the text field.
  final Widget? prefixIcon;

  // Widget displayed at the end of the text field.
  final Widget? suffixIcon;

  // Capitalization behavior for the text input.
  final TextCapitalization? textCapitalization;

  // Error message to display below the text field.
  final String? errorMessage;

  // Focus node for managing focus state.
  final FocusNode? focusNode;

  // Callback for when the text changes.
  final ValueChanged<String>? onChanged;

  // Constructor to initialize the properties of the text field.
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
