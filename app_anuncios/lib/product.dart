class Product {
  late String nome;
  late String descricao;
  late String preco;
  bool favorito = false;

  Product(this.nome, this.descricao, this.preco);

  void changeState() {
    this.favorito = !favorito;
  }
}
