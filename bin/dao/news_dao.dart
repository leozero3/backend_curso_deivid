import '../infra/database/db_configuration.dart';
import '../model/news_model.dart';
import 'dao.dart';

class NewsDAO implements DAO<NewsModel> {
  final DbConfiguration _dbConfiguration;

  NewsDAO(this._dbConfiguration);

  @override
  Future<bool> create(NewsModel value) async {
    var result = await _dbConfiguration.execQuery(
      'INSERT INTO noticias (titulo, descricao, id_usuario) VALUES (?, ?, ?)',
      [value.title, value.description, value.userId],
    );
    return result.affectedRows > 0;
  }

  @override
  Future<bool> delete(int id) async {
    var result =
        await _dbConfiguration.execQuery('DELETE from noticias where id = ?', [
      id,
    ]);
    return result.affectedRows > 0;
  }

  @override
  Future<List<NewsModel>> findAll() async {
    var result = await _dbConfiguration.execQuery('SELECT * FROM noticias');
    return result
        .map((r) => NewsModel.fromMap(r.fields))
        .toList()
        .cast<NewsModel>();
  }

  @override
  Future<NewsModel?> findOne(int id) async {
    var result = await _dbConfiguration
        .execQuery('SELECT * FROM noticias where id = ?', [id]);
    return result.affectedRows == 0
        ? null
        : NewsModel.fromMap(result.first.fields);
  }

  @override
  Future<bool> update(NewsModel value) async {
    var result = await _dbConfiguration.execQuery(
        'UPDATE noticias set titulo = ?, descricao = ? where id = ?', [
      value.title,
      value.description,
      value.id,
    ]);
    return result.affectedRows > 0;
  }
}
