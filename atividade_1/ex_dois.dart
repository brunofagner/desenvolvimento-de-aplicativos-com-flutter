import 'dart:io';

void main() {
  print("Insira um numero:");
  int dindin = int.parse(stdin.readLineSync()!);
  dindin = troco(dindin, 50);
  dindin = troco(dindin, 10);
  dindin = troco(dindin, 5);
  dindin = troco(dindin, 1);
  
}

int troco(int dindin, int nota) {
  int cedula = dindin~/nota;
  dindin = dindin % nota;
  print("${cedula} nota(s) de RS $nota,00");
  return dindin;
}
