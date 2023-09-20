// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NewsModel {
  final int? id;
  final String titulo;
  final String descricao;
  final String imagem;
  final DateTime dtPuplicacao;
  final DateTime? dtAtualizacao;

  NewsModel(
    this.id,
    this.titulo,
    this.descricao,
    this.imagem,
    this.dtPuplicacao,
    this.dtAtualizacao,
  );

  factory NewsModel.fromJson(Map map) {
    return NewsModel(
      map['id'] ?? '',
      map['titulo'] ,
      map['descricao'],
      map['imagem'] ,
      DateTime.fromMillisecondsSinceEpoch(map['dtPuplicacao']),
      map['dtAtualizacao'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dtAtualizacao'])
          : null,
    );
  }

  

  @override
  String toString() {
    return 'NewsModel(id: $id, titulo: $titulo, descricao: $descricao, imagem: $imagem, dtPuplicacao: $dtPuplicacao, dtAtualizacao: $dtAtualizacao)';
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'imagem': imagem,
      'dtPuplicacao': dtPuplicacao.millisecondsSinceEpoch,
      'dtAtualizacao': dtAtualizacao?.millisecondsSinceEpoch,
    };
  }

}
