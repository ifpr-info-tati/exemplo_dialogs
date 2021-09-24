import 'package:flutter/material.dart';

class DialogPasso2 extends StatelessWidget {
  final int selecao;
  final List<String> opcoes;
  final Function setSelecao;

  const DialogPasso2({
    Key? key,
    required this.selecao,
    required this.opcoes,
    required this.setSelecao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Text("Passo 2"),
        Column(
          children: [
            for (int i = 0; i < opcoes.length; i++)
              RadioListTile<int>(
                value: i,
                groupValue: selecao,
                onChanged: (newValue) {
                  setSelecao(newValue);
                },
                selected: selecao == i,
                title: Text(opcoes[i]),
              ),
          ],
        ),
      ]),
    );
  }
}
