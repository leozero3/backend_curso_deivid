import 'package:shelf/shelf.dart';
import 'api/news_api.dart';
import 'api/login_api.dart';
import 'api/usuario_api.dart';
import 'dao/usuario_dao.dart';
import 'infra/custom_server.dart';
import 'infra/database/db_configuration.dart';
import 'infra/dependency_injector/injects.dart';
import 'infra/middleware_interception.dart';
import 'model/usuario_model.dart';
import 'utils/custom_env.dart';

void main() async {
  CustomEnv.fromFile('.env-dev');
  var _di = Injects.initialize();

  // UsuarioDAO _usuarioDAO = UsuarioDAO(_di<DbConfiguration>());
  // var usuario = UsuarioModel()
  //   ..id = 5
  //   ..name = 'novo'
  //   ..email = 'email@email.com'
  //   ..password = '123';

  // _usuarioDAO.findAll().then(print);
  // // _usuarioDAO.findOne(4).then(print);
  // // _usuarioDAO.create(usuario).then(print);
  // // usuario.name = 'ATUALIZADO';
  // // _usuarioDAO.update(usuario).then(print);
  // // _usuarioDAO.delete(5).then(print);
  // // print(await _usuarioDAO.findOne(4));

  var cascadeHandler = Cascade()
      .add(_di.get<LoginApi>().getHandler())
      .add(_di.get<NewsApi>().getHandler(isSecurity: true))
      .add(_di.get<UsuarioApi>().getHandler(isSecurity: true))
      .handler;

  var handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(MiddlewareInterception().middleware)
      .addHandler(cascadeHandler);

  await CustomServer().initialize(
    handler: handler,
    address: await CustomEnv.get<String>(key: 'server_address'),
    port: await CustomEnv.get<int>(key: 'server_port'),
  );
}
