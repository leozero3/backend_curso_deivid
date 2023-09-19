import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class BlogApi {
  Handler get handler {

    Router router = Router();
    router.get('/blog/news', (Request req) {
      return Response.ok('Choveu hoje');
    });

    router.post('/blog/news', (Request req){
      return Response.ok('Choveu hoje');
    });

    router.put('/blog/news', (Request req){
      String? id = req.url.queryParameters['id'];
      return Response.ok('Choveu hoje');
    });

    router.delete('/blog/news', (Request req){
      String? id = req.url.queryParameters['id'];
      return Response.ok('Choveu hoje');
    });



    return router;
  }

}
