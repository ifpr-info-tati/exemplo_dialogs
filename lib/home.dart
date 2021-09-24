import 'package:flutter/material.dart';

import 'dialog_passo2.dart';
import 'dialog_passo1.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //para saber qual dialog será aberto.
  int passo = 0;
  String? dadosPasso1;
  String? dadosPasso2;

  /*utilizado para muda o passo e também salvar os dados
  que foram selecionados no dialog. Aqui o exemplo é uma
  string, mas pode ser qualquer coisa*/
  _mudaPasso(int inc, Map<String, dynamic> dados) {
    switch (passo) {
      case 0:
        dadosPasso1 = "${dados['passo1']}";
        break;
      case 1:
        dadosPasso2 = "${dados['passo2']}";
        break;
    }
    print("${dadosPasso1} ${dadosPasso2}");

    setState(() {
      passo += inc;
    });
    //chama o próximo dialog
    _showDialog();
  }

  /*Controla qual dialog será mostrado*/
  _showDialog() {
    switch (passo) {
      case 0:
        showDialog(
          context: context,
          builder: (ctx) => DialogPasso1(
            proximo: _mudaPasso,
          ),
        );
        break;
      case 1:
        showDialog(
          context: context,
          builder: (ctx) => DialogPasso2(
            proximo: _mudaPasso,
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplo Dialog'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Abrir"),
          onPressed: () {
            _showDialog();
          },
        ),
      ),
    );
  }
}

class DialogPasso3 {}
