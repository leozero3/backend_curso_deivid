import '../model/news_model.dart';
import 'generic_service.dart';

class NewsService implements GenericService<NewsModel> {
  List<NewsModel> _fakeDB = [];

  @override
  bool delete(int id) {
    _fakeDB.removeWhere((e) => e.id == id);
    return true;
  }

  @override
  List<NewsModel> findAll() {
    return _fakeDB;
  }

  @override
  NewsModel findOne(int id) {
    return _fakeDB.firstWhere((e) => e.id == id);
  }

  @override
  bool save(NewsModel value) {
    _fakeDB.firstWhere(
      (e) => e.id == value.id,
      orElse: () => value,
    );

    // _fakeDB.
    return true;
  }
}
