import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seguro_app/app/core/theme/app_colors.dart';

class CustomInput extends StatefulWidget {
  final String placeholder;
  final TextEditingController? controller;
  final EdgeInsetsGeometry padding;
  final bool isParagraph;

  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final TextInputType? keyboardType;

  const CustomInput({
    super.key,
    required this.placeholder,
    this.isParagraph = false,
    this.controller,
    this.padding = const EdgeInsets.all(0),
    this.validator,
    this.inputFormatters,
    this.obscureText = false,
    this.keyboardType,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    // Inicializa com o valor passado no widget
    _obscureText = widget.obscureText;
  }

  void _toggleObscure() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: TextFormField(
        controller: widget.controller,
        key: widget.key,
        validator: widget.validator,
        textAlign: TextAlign.center,
        inputFormatters: widget.inputFormatters,
        obscureText: _obscureText,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          hintText: widget.placeholder,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: AppColors.white70),
            gapPadding: 8,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: AppColors.white70),
            gapPadding: 8,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: AppColors.white70),
            gapPadding: 8,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: AppColors.red),
            gapPadding: 8,
          ),
          errorStyle: TextStyle(
            color: AppColors.red,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),

          contentPadding: EdgeInsets.symmetric(
            vertical: 15,
          ), // Ajuste a altura do campo

          prefixIcon: widget.obscureText
              ? SizedBox(
                  width: 48,
                ) // espaço vazio do mesmo tamanho do suffixIcon
              : null,

          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.white70,
                  ),
                  onPressed: _toggleObscure,
                )
              : null,
        ),
      ),
    );
  }
}
