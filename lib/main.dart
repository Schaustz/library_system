import 'dart:io';
import 'biblioteca.dart';

void main() {
  var biblioteca = Biblioteca();

  while (true) {
    print('\n=== Menu Biblioteca ===');
    print('1. Listar acervo');
    print('2. Cadastrar livro');
    print('3. Cadastrar revista');
    print('4. Emprestar produto');
    print('5. Listar produtos emprestados');
    print('6. Devolver produto');
    print('7. Sair\n');

    stdout.write('Digite sua opção: \n');
    String? escolha = stdin.readLineSync();

    switch (escolha) {
      case '1':
        biblioteca.listarAcervo();
        break;

      case '2':
        stdout.write('Digite o título do livro: ');
        String? tituloLivro = stdin.readLineSync();

        stdout.write('Digite o ano do livro: ');
        int? anoLivro = int.tryParse(stdin.readLineSync() ?? '');

        stdout.write('Digite o autor do livro: ');
        String? autorLivro = stdin.readLineSync();

        if (tituloLivro != null && anoLivro != null && autorLivro != null) {
          biblioteca.cadastrarLivro(tituloLivro, anoLivro, autorLivro);
        } else {
          print('Dados inválidos! Tente novamente.');
        }
        break;

      case '3':
        stdout.write('Digite o título da revista: ');
        String? tituloRevista = stdin.readLineSync();

        stdout.write('Digite o ano da revista: ');
        int? anoRevista = int.tryParse(stdin.readLineSync() ?? '');

        stdout.write('Digite a edição da revista: ');
        int? edicaoRevista = int.tryParse(stdin.readLineSync() ?? '');

        if (tituloRevista != null &&
            anoRevista != null &&
            edicaoRevista != null) {
          biblioteca.cadastrarRevista(tituloRevista, anoRevista, edicaoRevista);
        } else {
          print('Dados inválidos! Tente novamente.');
        }
        break;

      case '4':
        stdout.write('Digite o ID do produto que deseja emprestar: ');
        String? idProduto = stdin.readLineSync();

        stdout.write('Digite o nome do usuário para emprestar: ');
        String? nomeUsuario = stdin.readLineSync();

        if (idProduto != null && nomeUsuario != null) {
          biblioteca.emprestarProduto(idProduto, nomeUsuario);
        } else {
          print('Dados inválidos! Tente novamente.');
        }
        break;

      case '5':
        biblioteca.listarEmprestados();
        break;

      case '6':
        stdout.write('Digite o ID do produto que deseja devolver: ');
        String? idDevolver = stdin.readLineSync();

        if (idDevolver != null) {
          biblioteca.devolverProduto(idDevolver);
        } else {
          print('ID inválido! Tente novamente.');
        }
        break;

      case '7':
        print('Saindo... Até logo!');
        return;

      default:
        print('Opção inválida! Digite de 1 a 7.');
    }
  }
}
