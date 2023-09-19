// ignore_for_file: public_member_api_docs, sort_constructors_first
class NewsModel {
  final int id;
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

  @override
  String toString() {
    return 'NewsModel(id: $id, titulo: $titulo, descricao: $descricao, imagem: $imagem, dtPuplicacao: $dtPuplicacao, dtAtualizacao: $dtAtualizacao)';
  }
}
