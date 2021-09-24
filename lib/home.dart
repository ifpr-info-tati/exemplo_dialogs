import 'package:exemplo_dialog_passos/controle_dialog.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

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
            showDialog(context: context, builder: (ctx) => ControleDialog());
          },
        ),
      ),
    );
  }
}

class DialogPasso3 {}
