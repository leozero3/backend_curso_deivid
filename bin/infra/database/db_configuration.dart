abstract class DbConfiguration {
  Future<dynamic> creatConnection();

  Future<dynamic> get connection;
}
