import 'package:flutter/material.dart';

class TextFieldRequired extends StatefulWidget {
  const TextFieldRequired({
    super.key,
    required this.label,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon, // Thêm prefixIcon
    this.onTap,
    this.isDisabled,
    this.controller,
    this.content,
    this.isReadOnly = false,
    this.isObscureText = false, // Add this line
    this.isPassword = false,
  });

  final String label;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon; // Icon hiển thị bên trái
  final VoidCallback? onTap;
  final bool? isDisabled; // Để kiểm soát việc vô hiệu hóa TextField
  final TextEditingController? controller;
  final String? content; // Nội dung tĩnh (không thể thay đổi)
  final bool isReadOnly;

  final bool isObscureText; // Add this line
  final bool isPassword;

  @override
  State<TextFieldRequired> createState() => _TextFieldRequiredState();
}

class _TextFieldRequiredState extends State<TextFieldRequired> {
  bool _isObscureText = false;

  @override
  void initState() {
    super.initState();
    _isObscureText = widget.isObscureText;
  }

  @override
  Widget build(BuildContext context) {
    final isReadOnly = widget.content != null ||
        widget.isDisabled == true ||
        widget.isReadOnly; // Modify this line

    return TextField(
      autocorrect: false,
      controller: widget.controller ??
          (widget.content != null
              ? TextEditingController(text: widget.content)
              : null), // Nếu có `content`, hiển thị trong TextField
      focusNode: isReadOnly ? AlwaysDisabledFocusNode() : null, // Vô hiệu hóa
      onTap: widget.onTap,
      readOnly: isReadOnly, // Cài đặt `readOnly` cho TextField
      decoration: InputDecoration(
        label: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyMedium,
            children: [
              TextSpan(text: '${widget.label} '),
              TextSpan(
                text: '*',
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              )
            ],
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon, // Hiển thị prefixIcon
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _isObscureText = !_isObscureText;
                  });
                },
                icon: Icon(_isObscureText
                    ? Icons.visibility_off_rounded
                    : Icons.visibility_rounded))
            : widget.suffixIcon, // Hiển thị suffixIcon
      ),
      obscureText: _isObscureText,
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
