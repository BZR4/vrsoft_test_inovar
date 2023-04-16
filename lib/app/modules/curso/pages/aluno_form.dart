import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vrsoft_test_inovar/app/modules/aluno/aluno_controller.dart';
import 'package:vrsoft_test_inovar/app/shared/widgets/text_input_widget.dart';

class AlunoForm extends StatefulWidget {
  const AlunoForm({super.key});

  @override
  State<AlunoForm> createState() => _AlunoFormState();
}

class _AlunoFormState extends State<AlunoForm> {
  final controller = Modular.get<AlunoController>();
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro Alunos'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Modular.to.navigate('/alunos');
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InputTexto(
            controller: textController,
            campo: 'Nome',
            icon: Icons.text_fields,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            controller.salvar(textController.text);
            Modular.to.navigate('/alunos/');
          },
          label: const Text('SALVAR')),
    );
  }
}
