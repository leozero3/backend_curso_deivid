class NewsModel {
  int? id;
  String? title;
  String? description;
  DateTime? dtCreate;
  DateTime? dtUpdated;
  int? userId;

  NewsModel();
  factory NewsModel.fromMap(Map map) {
    return NewsModel()
      ..id = map['id']?.toInt()
      ..title = map['titulo']
      ..description = map['descricao'].toString()
      ..dtCreate = map['dt_criacao']
      ..dtUpdated = map['dt_autalizacao']
      ..userId = map['id_usuario'];
  }

  factory NewsModel.fromRequest(Map map) {
    return NewsModel()
      ..title = ['title'] as String?
      ..description = map['description']
      ..userId = map['userId']?.toInt();
  }

  Map toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  @override
  String toString() {
    return 'NewsModel(id: $id, title: $title, description: $description, dtCreate: $dtCreate, dtUpdated: $dtUpdated, userId: $userId)';
  }
}
