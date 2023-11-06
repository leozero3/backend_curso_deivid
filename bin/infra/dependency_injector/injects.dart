import '../../api/login_api.dart';
import '../../api/news_api.dart';
import '../../api/usuario_api.dart';
import '../../dao/usuario_dao.dart';
import '../../model/news_model.dart';
import '../../services/generic_service.dart';
import '../../services/login_service.dart';
import '../../services/news_service.dart';
import '../../services/usuario_service.dart';
import '../database/db_configuration.dart';
import '../database/mysql_db_configuration.dart';
import '../security/security_service.dart';
import '../security/security_service_imp.dart';
import 'dependency_injector.dart';

class Injects {
  static DependencyInjector initialize() {
    var di = DependencyInjector();

    di.register<DbConfiguration>(() => MysqlDbConfiguration());

    di.register<SecurityService>(() => SecurityServiceImp());

    di.register<GenericService<NewsModel>>(() => NewsService());

    di.register<NewsApi>(() => NewsApi(di<GenericService<NewsModel>>()));

    di.register<UsuarioDAO>(() => UsuarioDAO(di<DbConfiguration>()));

    di.register<UsuarioService>(() => UsuarioService(di<UsuarioDAO>()));

    di.register<UsuarioApi>(() => UsuarioApi(di<UsuarioService>()));

    di.register<LoginService>(() => LoginService(di<UsuarioService>()));
    di.register<LoginApi>(
        () => LoginApi(di<SecurityService>(), di<LoginService>()));
    return di;
  }
}
