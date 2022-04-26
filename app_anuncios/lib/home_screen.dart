import 'package:app_anuncios/product.dart';
import 'package:flutter/material.dart';

import 'cadastro_screen.dart';

//COLOQUE O NOME DAS FRUTAS IGUAL AO NOME DAS IMAGENS PARA FUNCIONAR BONITINHO <3
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Product> _lista = List<Product>.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('I-Frutinhas'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.separated(
        itemCount: _lista.length,
        separatorBuilder: (context, position) => const Divider(),
        itemBuilder: (context, position) {
          Product item = _lista.elementAt(position);
          return ListTile(
            key: Key(item.nome),
            isThreeLine: true,
            leading: Image.asset('images/${item.nome}.png'),
            title: Text(
              item.nome + ' - R\$ ' + item.preco,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              item.descricao,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Icon(
              Icons.favorite,
              size: 40,
              color: item.favorito ? Colors.red : Colors.grey,
            ),
            onTap: () {
              setState(() {
                item.changeState();
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            Product product = await Navigator.push(context,
                MaterialPageRoute(builder: (context) => CadastroScreen()));
            if (product != null) {
              setState(() {
                _lista.add(product);
              });
            }
          } catch (error) {
            // ignore: avoid_print
            print(error.toString());
          }
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}
