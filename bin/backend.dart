import 'package:shelf/shelf.dart';
import 'api/news_api.dart';
import 'api/login_api.dart';
import 'infra/custom_server.dart';
import 'infra/middleware_interception.dart';
import 'infra/security/security_service.dart';
import 'infra/security/security_service_imp.dart';
import 'services/news_service.dart';
import 'utils/custom_env.dart';

void main() async {
  CustomEnv.fromFile('.env-dev');

  SecurityService _securityService = SecurityServiceImp();

  var cascadeHandler = Cascade()
      .add(LoginApi(_securityService).getHandler(middlewares: [
        createMiddleware(
          requestHandler: (Request req) {
            print('LOG -> ${req.url}');
          },
        )
      ]))
      .add(NewsApi(NewsService()).getHandler(
        middlewares: [
          _securityService.authorization,
          _securityService.verifyJwt,
        ],
      ))
      .handler;

  var handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(MiddlewareInterception().middleware)
      // .addMiddleware(_securityService.authorization)
      // .addMiddleware(_securityService.verifyJwt)
      .addHandler(cascadeHandler);

  await CustomServer().initialize(
    handler: handler,
    address: await CustomEnv.get<String>(key: 'server_address'),
    port: await CustomEnv.get<int>(key: 'server_port'),
  );
}
