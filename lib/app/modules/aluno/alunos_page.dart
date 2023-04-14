import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vrsoft_test_inovar/app/entities/aluno_entity.dart';
import 'package:vrsoft_test_inovar/app/shared/utils/texto_utils.dart';
import 'package:vrsoft_test_inovar/app/shared/widgets/custom_card_widget.dart';

import '../../shared/widgets/text_input_widget.dart';
import 'aluno_controller.dart';

class AlunosPage extends StatelessWidget {
  const AlunosPage({super.key, required this.controller});

  final AlunoController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alunos'),
      ),
      body: Observer(
        builder: (context) {
          if (controller.alunos.isEmpty) {
            return const BackgroundCard(tipoCard: TipoCard.aluno);
          } else {
            return _buildListView(controller.alunos);
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final nomeController = TextEditingController();
          showBottomSheet(
            elevation: 4,
            context: context,
            builder: (context) {
              return SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    InputTexto(
                        controller: nomeController,
                        campo: 'Nome',
                        icon: Icons.text_fields),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 32, 32),
                      child: SizedBox(
                        height: 48,
                        child: FilledButton(
                          onPressed: () {
                            controller.salvar(nomeController.text);
                            Navigator.of(context).pop();
                          },
                          child: const Text('SALVAR'),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        label: const Text('CRIAR'),
      ),
    );
  }
}

Widget _buildListView(List<Aluno> alunos) {
  return ListView.builder(
    itemCount: alunos.length,
    itemBuilder: (context, index) {
      final aluno = alunos[index];

      return Card(
        child: ListTile(
          contentPadding: const EdgeInsets.all(8),
          leading: CircleAvatar(child: Text('${aluno.id}')),
          title: Text(aluno.nome),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Wrap(
              runAlignment: WrapAlignment.end,
              spacing: 8,
              children: aluno.cursos
                  .map((c) => Chip(
                      backgroundColor:
                          Theme.of(context).colorScheme.primary.withAlpha(25),
                      label: Text(
                        TextoUtils.getIniciais(c.descricao),
                        style: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .fontSize),
                      )))
                  .toList(),
            ),
          ),
        ),
      );
    },
  );
}
