import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../services/generic_service.dart';
import '../services/news_service.dart';

class NewsApi {
  final GenericService _service;

  NewsApi(this._service);

  Handler get handler {
    Router router = Router();
//

    router.get('/blog/news', (Request req) {
      // _service.findAll();
      return Response.ok('Choveu hoje');
    });

    router.post('/blog/news', (Request req) {
      // _service.save('');
      return Response.ok('Choveu hoje');
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

    return router;
  }
}
