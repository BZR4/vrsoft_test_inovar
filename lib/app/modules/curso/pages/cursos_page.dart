import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vrsoft_test_inovar/app/entities/curso_entity.dart';
import 'package:vrsoft_test_inovar/app/modules/aluno/aluno_controller.dart';
import 'package:vrsoft_test_inovar/app/modules/curso/curso_controller.dart';
import 'package:vrsoft_test_inovar/app/modules/curso/pages/curso_formulario.dart';
import 'package:vrsoft_test_inovar/app/modules/curso/pages/curso_page.dart';
import 'package:vrsoft_test_inovar/app/shared/utils/texto_utils.dart';
import 'package:vrsoft_test_inovar/app/shared/widgets/custom_card_widget.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../shared/widgets/text_input_widget.dart';

class CursosPage extends StatelessWidget {
  const CursosPage(
      {super.key,
      required this.cursoController,
      required this.alunoController});

  final CursoController cursoController;
  final AlunoController alunoController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cursos'),
      ),
      body: Observer(
        builder: (context) {
          if (cursoController.cursos.isEmpty) {
            return const BackgroundCard(tipoCard: TipoCard.curso);
          } else {
            return _buildListView(cursoController.cursos);
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final descricaoController = TextEditingController();
          final ementaController = TextEditingController();
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
                            cursoController.salvar(descricaoController.text,
                                ementaController.text);
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

  ListView _buildListView(List<Curso> cursos) {
    return ListView.builder(
      itemCount: cursos.length,
      itemBuilder: (context, index) {
        final curso = cursos[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CursoPage(curso: curso)));
          },
          child: Card(
            elevation: 4,
            child: ListTile(
              contentPadding: const EdgeInsets.all(8),
              leading: CircleAvatar(
                child: AutoSizeText(
                  TextoUtils.getIniciais(curso.descricao),
                ),
              ),
              title: Text(cursos[index].descricao),
              subtitle: Row(
                children: [
                  Text('${curso.alunos.length} alunos'),
                  const Spacer(),
                  Chip(
                    elevation: 1,
                    label: Text(
                      cursos[index].alunos.length <= 9
                          ? 'turma não fechada'
                          : 'turma cheia',
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
