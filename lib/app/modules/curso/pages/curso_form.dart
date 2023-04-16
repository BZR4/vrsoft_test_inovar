import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vrsoft_test_inovar/app/modules/curso/curso_controller.dart';
import 'package:vrsoft_test_inovar/app/shared/widgets/text_input_widget.dart';

class CursoForm extends StatelessWidget {
  const CursoForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cursoController = Modular.get<CursoController>();

    final descricaoController = TextEditingController();
    final ementaController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Curso'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Modular.to.navigate('/cursos');
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InputTexto(
              controller: descricaoController,
              campo: 'Descrição',
              icon: Icons.text_fields),
          InputTexto(
            controller: ementaController,
            campo: 'Ementa',
            icon: Icons.text_fields,
            multiLinhas: 3,
            limite: 500,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 32, 32),
            child: SizedBox(
              height: 48,
              child: FilledButton(
                onPressed: () {
                  cursoController.salvar(
                      descricaoController.text, ementaController.text);
                  Modular.to.navigate('/cursos/');
                },
                child: const Text('SALVAR'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
