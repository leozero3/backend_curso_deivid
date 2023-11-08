import '../../api/login_api.dart';
import '../../api/news_api.dart';
import '../../api/usuario_api.dart';
import '../../dao/news_DAO.dart';
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

    //BANCO DE DADOS
    di.register<DbConfiguration>(() => MysqlDbConfiguration());

    //SEGURANÇA
    di.register<SecurityService>(() => SecurityServiceImp());

    // NEWS
    di.register<NewsDAO>(() => NewsDAO(di<DbConfiguration>()));
    di.register<GenericService<NewsModel>>(() => NewsService(di<NewsDAO>()));
    di.register<NewsApi>(() => NewsApi(di<GenericService<NewsModel>>()));

    // USUARIO
    di.register<UsuarioDAO>(() => UsuarioDAO(di<DbConfiguration>()));
    di.register<UsuarioService>(() => UsuarioService(di<UsuarioDAO>()));
    di.register<UsuarioApi>(() => UsuarioApi(di<UsuarioService>()));

    //  LOGIN
    di.register<LoginService>(() => LoginService(di<UsuarioService>()));
    di.register<LoginApi>(
        () => LoginApi(di<SecurityService>(), di<LoginService>()));

    return di;
  }
}
