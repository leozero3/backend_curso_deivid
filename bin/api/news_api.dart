import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../model/news_model.dart';
import '../services/generic_service.dart';
import '../services/news_service.dart';
import 'api.dart';

class NewsApi extends Api {
  final GenericService<NewsModel> _service;

  NewsApi(this._service);

  @override
  Handler getHandler({List<Middleware>? middlewares}) {
    Router router = Router();
//

    router.get('/blog/news', (Request req) {
      List<NewsModel> news = _service.findAll();
      List<Map> newsMap = news.map((e) => e.toJson()).toList();
      return Response.ok(jsonEncode(newsMap),
          headers: {'content-type': 'application/json'});
    });

    router.post('/blog/news', (Request req) async {
      var body = await req.readAsString();
      _service.save(NewsModel.fromJson(jsonDecode(body)));
      return Response(201);
    });

    router.put('/blog/news', (Request req) {
      String? id = req.url.queryParameters['id'];
      // _service.save('');
      return Response.ok('Choveu hoje');
    });

    router.delete('/blog/news', (Request req) {
      String? id = req.url.queryParameters['id'];
      // _service.delete(1);
      return Response.ok('Choveu hoje');
    });

    return createHandler(router: router, middlewares: middlewares);
  }
}
