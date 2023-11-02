import '../dao/usuario_dao.dart';
import '../model/usuario_model.dart';
import 'generic_service.dart';

class UsuarioService implements GenericService<UsuarioModel> {
  final UsuarioDAO _usuarioDAO;

  UsuarioService(this._usuarioDAO);

  @override
  Future<bool> delete(int id) async {
    return await _usuarioDAO.delete(id);
  }

  @override
  Future<List<UsuarioModel>> findAll() async {
    return await _usuarioDAO.findAll();
  }

  @override
  Future<UsuarioModel?> findOne(int id) async {
    return await _usuarioDAO.findOne(id);
  }

  @override
  Future<bool> save(UsuarioModel value) async {
    if (value.id != null) {
      return _usuarioDAO.update(value);
    } else {
      return _usuarioDAO.create(value);
    }
  }
}