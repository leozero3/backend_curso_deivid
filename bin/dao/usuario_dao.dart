import '../infra/database/db_configuration.dart';
import '../model/usuario_model.dart';
import 'dao.dart';

class UsuarioDAO implements DAO<UsuarioModel> {
  final DbConfiguration _dbConfiguration;

  UsuarioDAO(this._dbConfiguration);

  @override
  Future create(UsuarioModel value) async {
    final String SQL =
        'INSERT INTO usuarios (nome, email, password) VALUES (?, ?, ?)';

    var connection = await _dbConfiguration.connection;
    var result = await connection.query(SQL, [
      value.name,
      value.email,
      value.password,
    ]);
    return result.result.affectedRows > 0;
  }

  @override
  Future delete(int id) async {
    final String SQL = 'DELETE from usuarios where id = ?;';

    var connection = await _dbConfiguration.connection;
    var result = await connection.query(SQL, [
      id,
    ]);
    return result.result.affectedRows > 0;
  }

  @override
  Future<List<UsuarioModel>> findAll() async {
    final String SQL = 'SELECT * FROM usuarios';
    var connection = await _dbConfiguration.connection;
    var result = await connection.query(SQL);

    List<UsuarioModel> _usuario = [];
    for (var r in result) {
      _usuario.add(UsuarioModel.fromMap(r.fields));
    }
    return _usuario;
  }

  @override
  Future<UsuarioModel> findOne(int id) async {
    final String SQL = 'SELECT * FROM usuarios where id = ?';

    var connection = await _dbConfiguration.connection;
    var result = await connection.query(SQL, [id]);

    if (result.length <= 0)
      throw Exception('[ERROR/DB] -> findOne for id: $id, Not Found');

    return UsuarioModel.fromMap(result.first.fields);
  }

  @override
  Future update(UsuarioModel value) async {
    final String SQL =
        'UPDATE usuarios set nome = ?, password = ? where id = ?';

    var connection = await _dbConfiguration.connection;
    var result = await connection.query(SQL, [
      value.name,
      value.password,
      value.id,
    ]);
    return result.affectedRows > 0;
  }
}
