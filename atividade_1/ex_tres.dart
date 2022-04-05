import 'dart:io';
void main() {
  int quantidade = 0;
  int maior = 0;
  int menor = 0;
  int soma=0;
  while (true) {
    print("Digite um numero");
    int num = int.parse(stdin.readLineSync()!);

    if (quantidade == 0) {
      maior = num;
      menor = num; 
      quantidade++;
      soma += num;
    }else if(num == -1){
      break;
    }else{
      soma += num;
      quantidade++;
      (num > maior) ? maior = num : maior = maior;
      (num < menor) ? menor = num : menor = menor;
    }
  }
    print("Quantidade: $quantidade");
    print("Maior numero $maior");
    print("Menor numero $menor");
    double media = soma/quantidade;
    print("Media = $media");
}