import 'package:mysql1/mysql1.dart';

import '../../utils/custom_env.dart';
import 'db_configuration.dart';

class MysqlDbConfiguration implements DbConfiguration {
  MySqlConnection? _connection;

  @override
  Future<MySqlConnection> get connection async {
    if (_connection == null) {
      _connection = await creatConnection();
    }
    if (_connection == null) {
      throw Exception('[ERROR/DB] -> falha ao criar conexao');
    }
    return _connection!;
  }

  @override
  Future<MySqlConnection> creatConnection() async {
    return await MySqlConnection.connect(
      ConnectionSettings(
        host: await CustomEnv.get<String>(key: 'db_host'),
        port: await CustomEnv.get<int>(key: 'db_port'),
        user: await CustomEnv.get<String>(key: 'db_user'),
        password: await CustomEnv.get<String>(key: 'db_pass'),
        db: await CustomEnv.get<String>(key: 'db_schema'),
      ),
    );
  }
}
