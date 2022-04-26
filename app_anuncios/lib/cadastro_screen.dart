import 'package:app_anuncios/product.dart';
import 'package:flutter/material.dart';

//COLOQUE O NOME DAS FRUTAS IGUAL AO NOME DAS IMAGENS PARA FUNCIONAR BONITINHO <3
class CadastroScreen extends StatefulWidget {
  Product? product;
  CadastroScreen({this.product});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _precoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      _nomeController.text = widget.product!.nome;
      _descricaoController.text = widget.product!.descricao;
      _precoController.text = widget.product!.preco;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cadastro Task"),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 20),
                    child: TextFormField(
                      controller: _nomeController,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "Preenchimento obrigatorio!";
                        }
                        if (value.toString().length < 3) {
                          return "Minimo de 3 caracteres";
                        }
                        return null;
                      },
                      style: const TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                        labelText: "Nome da fruta",
                        labelStyle:
                            TextStyle(fontSize: 20, color: Colors.redAccent),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.red)),
                        errorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.red)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.red)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.red)),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 20),
                    child: TextFormField(
                      controller: _descricaoController,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "Preenchimento obrigatorio!";
                        }
                        if (value.toString().length < 3) {
                          return "Minimo de 3 caracteres";
                        }
                        return null;
                      },
                      style: const TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                        labelText: "Descrição",
                        labelStyle:
                            TextStyle(fontSize: 20, color: Colors.redAccent),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.red)),
                        errorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.red)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.red)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.red)),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 20),
                    child: TextFormField(
                      controller: _precoController,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "Preenchimento obrigatorio!";
                        }
                        if (value.toString().length < 3) {
                          return "Minimo de 3 caracteres";
                        }
                        return null;
                      },
                      style: const TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                        labelText: "Preço",
                        labelStyle:
                            TextStyle(fontSize: 20, color: Colors.redAccent),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.red)),
                        errorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.red)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.red)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.red)),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          height: 55,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                String nome = _nomeController.text.toString();
                                String descricao =
                                    _descricaoController.text.toString();
                                String preco = _precoController.text.toString();
                                Product newProduct =
                                    Product(nome, descricao, preco);
                                Navigator.pop(context, newProduct);
                              }
                            },
                            child: Text(
                              widget.product == null ? "Cadastrar" : "Editar",
                              style: const TextStyle(fontSize: 20),
                            ),
                            style:
                                ElevatedButton.styleFrom(primary: Colors.green),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            "Cancelar",
                            style: TextStyle(fontSize: 20),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                        ),
                      )),
                    ],
                  )
                ],
              )),
        ));
  }
}
