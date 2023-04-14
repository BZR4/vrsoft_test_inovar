import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:vrsoft_test_inovar/app/entities/curso_entity.dart';
import 'package:vrsoft_test_inovar/app/shared/utils/texto_utils.dart';

class CursoPage extends StatelessWidget {
  const CursoPage({super.key, required this.curso});

  final Curso curso;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(curso.descricao,
            style: const TextStyle(overflow: TextOverflow.ellipsis)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.person_add))
        ],
      ),
      body: Column(
        children: [
          Card(
            elevation: 4,
            semanticContainer: true,
            child: ListTile(
              leading: CircleAvatar(
                child: AutoSizeText(
                  TextoUtils.getIniciais(curso.descricao),
                ),
              ),
              title: Text(curso.descricao),
              subtitle: Text(curso.ementa),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: curso.alunos.length,
              itemBuilder: (context, index) {
                var aluno = curso.alunos[index];
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(child: Text('${aluno.id}')),
                      title: Text(aluno.nome),
                      subtitle: Wrap(
                        spacing: 8,
                        children: aluno.cursos
                            .map((c) => Chip(
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withAlpha(25),
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
            ),
          )
        ],
      ),
    );
  }
}
