

class FormValidators {
   static String? emailValidation (String? value) {

      final emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'
    );

    if (value == null || value.isEmpty) {
      return 'Campo Requerido';
    }

    if (!emailRegExp.hasMatch(value)) {
      return "No es un correo electronico";
    }
  }

  static String? passwordValidation ( String? value) {

    print(value);

    final passwordRegExp = RegExp(r'(?=.*[A-Z])');
    if (value == null || value.isEmpty) {
      return 'Campo Requerido';
    }
     if (!passwordRegExp.hasMatch(value)) {
      print("ENTER HERE");
      return "Debe tener almenos una minuscula";
    }

  }

  static String? inputValidation ( String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo Requerido';
    }
  }
}