abstract class StringHelper {
  static String cpfToEmail(String cpf) {
    return cpf.replaceAll(RegExp(r'[^0-9]'), '') + '@meusistema.com';
  }

  static String? validateCpf(String? value) {
    if (value == null || value.isEmpty) return 'CPF obrigatório';
    final cpfNumbers = value.replaceAll(RegExp(r'[^0-9]'), '');
    if (cpfNumbers.length != 11) return 'CPF deve ter 11 números';
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Senha obrigatória';
    if (value.length < 6) return 'Senha deve ter ao menos 6 caracteres';
    return null;
  }
}
