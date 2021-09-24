import 'package:flutter/material.dart';

class DialogPasso2 extends StatefulWidget {
  final Function proximo;

  const DialogPasso2({
    Key? key,
    required this.proximo,
  }) : super(key: key);
  @override
  State<DialogPasso2> createState() => _DialogPasso2State();
}

class _DialogPasso2State extends State<DialogPasso2> {
  int _selecao = 0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Center(
        child: Column(
          children: [
            Text("Passo 2"),
            Expanded(
              child: ListView(
                children: [
                  RadioListTile<int>(
                    value: 0,
                    groupValue: _selecao,
                    onChanged: (newValue) {
                      setState(() {
                        _selecao = newValue ?? 0;
                      });
                    },
                    selected: _selecao == 0,
                    title: Text("0"),
                  ),
                  RadioListTile<int>(
                    value: 1,
                    groupValue: _selecao,
                    onChanged: (newValue) {
                      setState(() {
                        _selecao = newValue ?? 0;
                      });
                    },
                    selected: _selecao == 1,
                    title: Text("1"),
                  ),
                  RadioListTile<int>(
                    value: 2,
                    groupValue: _selecao,
                    onChanged: (newValue) {
                      setState(() {
                        _selecao = newValue ?? 0;
                      });
                    },
                    selected: _selecao == 2,
                    title: Text("2"),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                widget.proximo(1, {'passo2': _selecao});
              },
              child: Text("Próximo"),
            )
          ],
        ),
      ),
    );
  }
}
