import 'package:flutter/material.dart';
import 'package:real_estate_admin/core/ui/app_text_styles.dart';

class PrimaryTextFormField extends StatefulWidget {
  final String initialValue;
  final String label;
  final ValueChanged<String> onChanged;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;
  final TextInputType? textInputType;

  const PrimaryTextFormField({
    super.key,
    required this.initialValue,
    required this.label,
    required this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap, this.textInputType,
  });

  @override
  State<PrimaryTextFormField> createState() => _PrimaryTextFormFieldState();
}

class _PrimaryTextFormFieldState extends State<PrimaryTextFormField> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.initialValue);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: AppTextStyles.subtitleText(context),),
        const SizedBox(height: 12,),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextFormField(
            keyboardType: widget.textInputType,
            controller: _controller,
            onChanged: widget.onChanged,
            style: const TextStyle(fontSize: 16),
            decoration: InputDecoration(
              labelText: widget.label,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              prefixIcon: widget.prefixIcon != null
                  ? Icon(widget.prefixIcon)
                  : null,
              suffixIcon: widget.suffixIcon != null
                  ? GestureDetector(
                onTap: widget.onSuffixTap,
                child: Icon(widget.suffixIcon),
              )
                  : null,
            ),
          ),
        ),
        const SizedBox(height: 20,),

      ],
    );
  }
}
