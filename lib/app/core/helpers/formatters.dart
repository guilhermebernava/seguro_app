import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

abstract class Formatters {
  static final cpfMaskFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {"#": RegExp(r'[0-9]')},
  );
}
