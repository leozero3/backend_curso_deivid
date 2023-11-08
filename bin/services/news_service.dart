import '../dao/news_DAO.dart';
import '../model/news_model.dart';
import 'generic_service.dart';

class NewsService implements GenericService<NewsModel> {
  final NewsDAO _newsDAO;

  NewsService(this._newsDAO);

  @override
  Future<bool> delete(int id) async {
    return _newsDAO.delete(id);
  }

  @override
  Future<List<NewsModel>> findAll() async {
    return _newsDAO.findAll();
  }

  @override
  Future<NewsModel?> findOne(int id) async {
    return _newsDAO.findOne(id);
  }

  @override
  Future<bool> save(NewsModel value) async {
    if (value.id != null) {
      return _newsDAO.update(value);
    } else {
      return _newsDAO.create(value);
    }
  }
}
