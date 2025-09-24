import 'produto.dart';

class Revista extends Produto {
  int edicao;

  Revista(String titulo, int ano, String id, this.edicao)
      : super(titulo, ano, id);

  @override
  void exibirDetalhes() {
    print('ID: $id | Revista: $titulo, Edição: $edicao, Ano: $ano');
  }
}
