import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class InputWorkspaceField extends StatefulWidget {
  final String label;
  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? textStyle;

  const InputWorkspaceField({
    super.key,
    required this.label,
    this.hintText,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.textStyle,
  });

  @override
  State<InputWorkspaceField> createState() => _InputWorkspaceFieldState();
}

class _InputWorkspaceFieldState extends State<InputWorkspaceField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label.isNotEmpty) ...[
          Text(
            widget.label,
            style: AppTextStyles.labelMedium,
          ),
          const SizedBox(height: 8),
        ],
        Container(
          height: 52,
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12), // md radius
            border: Border.all(
              color: _isFocused ? AppColors.primary : Colors.transparent,
              width: _isFocused ? 1 : 0,
            ),
            boxShadow: _isFocused
                ? [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.2),
                      blurRadius: 4,
                      spreadRadius: 2,
                    )
                  ]
                : [],
          ),
          child: TextField(
            controller: widget.controller,
            focusNode: _focusNode,
            obscureText: widget.obscureText,
            keyboardType: widget.keyboardType,
            style: widget.textStyle ?? AppTextStyles.bodyLarge,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: (widget.textStyle ?? AppTextStyles.bodyLarge).copyWith(
                color: AppColors.outlineVariant,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              prefixIcon: widget.prefixIcon,
              prefixIconConstraints: const BoxConstraints(minWidth: 40, minHeight: 0),
              suffixIcon: widget.suffixIcon,
              suffixIconConstraints: const BoxConstraints(minWidth: 40, minHeight: 0),
            ),
          ),
        ),
      ],
    );
  }
}
