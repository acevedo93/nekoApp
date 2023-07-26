enum AuthResultStatus { aborted, success, failure }

class AuthResult {
  final AuthResultStatus status;
  final String message;
  AuthResult({required this.status, this.message= 'ok'});
}
