abstract class DbConfiguration {
  Future<dynamic> creatConnection();

  Future<dynamic> get connection;

  execQuery(String sql, [List? params]);
}
