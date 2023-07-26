

import 'package:firebase_core/firebase_core.dart';

class FirebaseErrorAdapter {
  static Map<String, String> errorMap = {
    'invalid-argument': 'El argumento es inválido',
    'missing-argument': 'Falta el argumento',
    'operation-not-supported': 'La operación no es compatible',
    'invalid-state': 'El estado es inválido',
    'timeout': 'Se agotó el tiempo de espera',
    'unknown': 'Error desconocido',
    'invalid-email': 'El correo electrónico contraseña proporcionada no es válida',
    'invalid-password': 'El correo electrónico contraseña proporcionada no es válida',
    'user-not-found':
        'El correo electrónico contraseña proporcionada no es válida',
    'wrong-password':
        'El correo electrónico contraseña proporcionada no es válida',
    'too-many-requests':
        'Se han realizado demasiadas solicitudes de autenticación en un corto período de tiempo',
    'network-error':
        'Se produjo un error de red al intentar autenticar al usuario',
    'unknown-error':
        'Se produjo un error desconocido al intentar autenticar al usuario',
  };

  static String getErrorMessage(FirebaseException error) {
    String errorMessage = errorMap[error.code] ?? 'Error desconocido';
    return errorMessage;
  }
}
