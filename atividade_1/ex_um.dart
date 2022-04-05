import 'dart:io';

void main() {
  print("Insira um numero:");
  int n1 = int.parse(stdin.readLineSync()!);
  var fatorialR = fatorial(n1);
  print("O fatorial é: " + fatorialR.toString());
}

int fatorial(int n1) {
  int resultado = 1;
  for (var i = n1; i > 0; i--) {
    resultado *= i;
  }
  return resultado;
}
