// ignore_for_file: public_member_api_docs, sort_constructors_first
class UsuarioModel {
  int? id;
  String? name;
  String? password;
  String? email;
  bool? isActived;
  DateTime? dtCreated;
  DateTime? dtUpdate;

  UsuarioModel();

  UsuarioModel.create(
    this.id,
    this.name,
    this.email,
    this.isActived,
    this.dtCreated,
    this.dtUpdate,
  );

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel.create(
      map['id'] as int,
      map['nome'] as String,
      map['email'] as String,
      map['is_Ativo '] == 0,
      map['dt_criacao'],
      map['dt_autalizacao'],
    );
  }

  @override
  String toString() {
    return 'UsuarioModel(id: $id, name: $name, email: $email, isActived: $isActived, dtCreated: $dtCreated, dtUpdate: $dtUpdate)';
  }
}
