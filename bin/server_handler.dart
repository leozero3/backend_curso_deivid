import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ServeHandler {
  Handler get handler {
    final router = Router();

    router.get('/', (Request request) {
      return Response(200, body: 'Primeira rota');
    });

    router.get('/ola/mundo/<usuario>', (Request req, String usuario){
      return Response.ok("ola mundo $usuario");
    });


    router.get('/query', (Request req){  //http://localhost:8080/query?nome=leo&idade=26
      String? nome = req.url.queryParameters['nome'];
      String? idade = req.url.queryParameters['idade'];
      return Response.ok('Query: $nome, idade: $idade');

    });

    return router;
  }
}
