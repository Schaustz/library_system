import 'produto.dart';
import 'livro.dart';
import 'revista.dart';

class Biblioteca {
  final List<Produto> _acervo = [];
  final Map<String, Produto> _produtosEmprestados = {};
  int _contadorId = 1;

  void adicionarProduto(Produto produto) {
    _acervo.add(produto);
    _contadorId++;
  }

  void cadastrarLivro(String titulo, int ano, String autor) {
    String id = _gerarId();
    Livro livro = Livro(titulo, ano, id, autor);
    adicionarProduto(livro);
    print('Livro "$titulo" cadastrado com ID: $id');
  }

  void cadastrarRevista(String titulo, int ano, int edicao) {
    String id = _gerarId();
    Revista revista = Revista(titulo, ano, id, edicao);
    adicionarProduto(revista);
    print('Revista "$titulo" cadastrada com ID: $id');
  }

  String _gerarId() {
    return _contadorId.toString().padLeft(3, '0');
  }

  void listarAcervo() {
    if (_acervo.isEmpty) {
      print('Nenhum produto no acervo.');
    } else {
      for (var produto in _acervo) {
        produto.exibirDetalhes();
      }
    }
  }

  void emprestarProduto(String id, String nomeUsuario) {
    try {
      var produto = _acervo.firstWhere((p) => p.id == id);
      _acervo.remove(produto);
      _produtosEmprestados[nomeUsuario] = produto;
      print('Produto com ID: $id emprestado para $nomeUsuario.');
    } catch (e) {
      print('Produto com ID: $id não encontrado no acervo.');
    }
  }

  void listarEmprestados() {
    if (_produtosEmprestados.isEmpty) {
      print('Nenhum produto emprestado.');
    } else {
      _produtosEmprestados.forEach((usuario, produto) {
        print('Produto emprestado para $usuario:');
        produto.exibirDetalhes();
      });
    }
  }

  void devolverProduto(String id) {
    try {
      var usuario = _produtosEmprestados.keys.firstWhere(
        (key) => _produtosEmprestados[key]!.id == id,
      );
      var produto = _produtosEmprestados.remove(usuario);
      if (produto != null) {
        _acervo.add(produto);
        print('Produto com ID: $id devolvido e adicionado ao acervo.');
      }
    } catch (e) {
      print('Produto com ID: $id não encontrado entre os emprestados.');
    }
  }
}
