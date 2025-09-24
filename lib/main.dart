import 'dart:io';
import 'biblioteca.dart';

void main() {
  var biblioteca = Biblioteca();

  while (true) {
    print('\n=== Menu Biblioteca ===');
    print('0. Ajuda.');
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
      case '0':
        print('=== Guia Rápido: Menu da Biblioteca ===\n');
        print('1. Ajuda (Opção 0):');
        print(
            '   Exibe este guia com explicações sobre o que cada opção do menu faz.\n');

        print('2. Listar Acervo (Opção 1):');
        print(
            '   Mostra todos os livros e revistas disponíveis no acervo da biblioteca.\n');

        print('3. Cadastrar Livro (Opção 2):');
        print('   Permite adicionar um novo livro ao acervo da biblioteca.\n');

        print('4. Cadastrar Revista (Opção 3):');
        print(
            '   Permite adicionar uma nova revista ao acervo da biblioteca.\n');

        print('5. Emprestar Produto (Opção 4):');
        print('   Permite emprestar um livro ou revista para um usuário.\n');

        print('6. Listar Produtos Emprestados (Opção 5):');
        print(
            '   Exibe a lista de livros e revistas que estão atualmente emprestados.\n');

        print('7. Devolver Produto (Opção 6):');
        print(
            '   Permite que o usuário devolva um livro ou revista emprestada.\n');

        print('8. Sair (Opção 7):');
        print('   Encerra o sistema da biblioteca.\n');
        break;

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
