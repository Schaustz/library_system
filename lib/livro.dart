import 'produto.dart';

class Livro extends Produto {
  String _autor;

  Livro(String titulo, int ano, String id, this._autor)
      : super(titulo, ano, id);

  String get autor => _autor;

  @override
  void exibirDetalhes() {
    print('ID: $id | Livro: $titulo, Autor: $autor, Ano: $ano');
  }
}
