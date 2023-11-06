import 'dart:developer';
import 'package:password_dart/password_dart.dart';
import '../to/auth_to.dart';
import 'usuario_service.dart';

class LoginService {
  final UsuarioService _usuarioService;

  LoginService(this._usuarioService);

  Future<int> authenticate(AuthTo to) async {
    //buscar no BD pelo to.email
    try {
      var user = await _usuarioService.findByEmail(to.email);
      if (user == null) {
        return -1;
      }

      return Password.verify(to.password, user.password!) ? user.id! : -1;
    } catch (e) {
      log('[Error] -> in AUTHENTICATE methot by enmail ${to.email}');
    }
    return -1;
  }
}
