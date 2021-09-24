import 'package:flutter/material.dart';

class DialogPasso1 extends StatelessWidget {
  final int selecao;
  final List<String> opcoes;
  final Function setOpcao;

  const DialogPasso1({
    Key? key,
    required this.selecao,
    required this.opcoes,
    required this.setOpcao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Passo 1"),
        Column(
          children: [
            for (int i = 0; i < opcoes.length; i++)
              RadioListTile<int>(
                value: i,
                groupValue: selecao,
                onChanged: (newValue) {
                  setOpcao(newValue);
                },
                selected: selecao == i,
                title: Text(opcoes[i]),
              ),
          ],
        )
      ],
    );
  }
}
