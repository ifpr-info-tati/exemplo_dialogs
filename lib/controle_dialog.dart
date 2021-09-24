import 'package:exemplo_dialog_passos/dialog_passo1.dart';
import 'package:flutter/material.dart';

import 'dialog_passo2.dart';

class ControleDialog extends StatefulWidget {
  const ControleDialog({Key? key}) : super(key: key);

  @override
  State<ControleDialog> createState() => _ControleDialogState();
}

class _ControleDialogState extends State<ControleDialog> {
  int _indexStep = 0;
  final int _maxSteps = 3;
  int selecaoPasso1 = 0;
  int selecaoPasso2 = 0;

  _setOpcaoPasso1(int value) {
    setState(() {
      selecaoPasso1 = value;
    });
  }

  _setOpcaoPasso2(int value) {
    setState(() {
      selecaoPasso2 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Stepper(
        type: StepperType.horizontal,
        currentStep: _indexStep,
        onStepContinue: _indexStep + 1 < _maxSteps
            ? () {
                setState(() {
                  _indexStep += 1;
                });
                print(_indexStep);
              }
            : null,
        onStepCancel: _indexStep >= 1
            ? () {
                setState(() {
                  _indexStep -= 1;
                });
              }
            : null,
        controlsBuilder: (ctx, {onStepContinue, onStepCancel}) {
          final isFirstStep = _indexStep == 0;
          final isLastStep = _indexStep == _maxSteps - 1;
          return isFirstStep
              ? ElevatedButton(
                  onPressed: onStepContinue, child: Text("Próximo"))
              : isLastStep
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            onPressed: onStepCancel, child: Text("Voltar")),
                        ElevatedButton(
                            onPressed: () {
                              print("Finalizar....");
                            },
                            child: Text("Finalizar"))
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          ElevatedButton(
                              onPressed: onStepCancel, child: Text("Voltar")),
                          ElevatedButton(
                              onPressed: onStepContinue,
                              child: Text("Próximo")),
                        ]);
        },
        steps: [
          Step(
            isActive: _indexStep >= 0,
            title: Text("Passo 1"),
            content: DialogPasso1(
              selecao: selecaoPasso1,
              opcoes: ["Opcao 1", "Opcao 2", "Opcao 3"],
              setOpcao: _setOpcaoPasso1,
            ),
          ),
          Step(
            isActive: _indexStep >= 1,
            title: Text("Passo 2"),
            content: DialogPasso2(
              selecao: selecaoPasso2,
              opcoes: ["Opcao 1", "Opcao 2"],
              setSelecao: _setOpcaoPasso2,
            ),
          ),
          Step(
            isActive: _indexStep >= 2,
            title: Text("Passo 3"),
            content: Column(
              children: [
                Text("Passo 1: ${selecaoPasso1}"),
                Text("Passo 2: ${selecaoPasso2}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
