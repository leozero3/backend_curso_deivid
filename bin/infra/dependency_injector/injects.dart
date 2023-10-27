import '../../api/login_api.dart';
import '../../api/news_api.dart';
import '../../model/news_model.dart';
import '../../services/generic_service.dart';
import '../../services/news_service.dart';
import '../security/security_service.dart';
import '../security/security_service_imp.dart';
import 'dependency_injector.dart';

class Injects {
  static DependencyInjector initialize() {
    final di = DependencyInjector();

    di.register<SecurityService>(
      () => SecurityServiceImp(),
    );

    di.register<LoginApi>(() => LoginApi(di<SecurityService>()));
    di.register<GenericService<NewsModel>>(
      () => NewsService(),
    );

    di.register<NewsApi>(() => NewsApi(di<GenericService<NewsModel>>()));

    return di;
  }
}
