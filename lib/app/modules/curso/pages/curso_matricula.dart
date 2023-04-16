import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vrsoft_test_inovar/app/entities/aluno_entity.dart';
import 'package:vrsoft_test_inovar/app/entities/curso_entity.dart';
import 'package:vrsoft_test_inovar/app/modules/aluno/aluno_controller.dart';
import 'package:vrsoft_test_inovar/app/modules/curso/curso_controller.dart';

class CursoMatricula extends StatefulWidget {
  const CursoMatricula({super.key});

  @override
  State<CursoMatricula> createState() => _CursoMatriculaState();
}

class _CursoMatriculaState extends State<CursoMatricula> {
  late final CursoController cursoController;
  late final AlunoController alunoController;

  @override
  void initState() {
    super.initState();
    cursoController = Modular.get<CursoController>();
    alunoController = Modular.get<AlunoController>();
    cursoController.carregar();
    alunoController.carregar();
  }

  Curso? cursoSelecionado;

  Aluno? alunoSelecionado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matrículas'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Modular.to.navigate('/');
          },
        ),
      ),
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text('Curso'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Observer(
                builder: (BuildContext context) => DropdownButton(
                  value: cursoSelecionado,
                  items: cursoController.cursos
                      .map((element) => DropdownMenuItem<Curso>(
                          value: element, child: Text(element.descricao)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      cursoSelecionado = value!;
                    });
                  },
                ),
              ),
            ),
            const Divider(
              endIndent: 16,
              indent: 16,
              height: 16,
              thickness: 2,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Text('Alunos'),
            ),
            Observer(
              builder: (BuildContext context) => Wrap(
                spacing: 5,
                runSpacing: 5,
                alignment: WrapAlignment.spaceAround,
                children: alunoController.alunos.map((c) {
                  return ChoiceChip(
                    tooltip: 'Possui ${c.cursos.length} matrículas.',
                    selectedColor:
                        Theme.of(context).colorScheme.primary.withAlpha(125),
                    label: Text(c.nome),
                    selected: alunoSelecionado == c,
                    onSelected: (value) {
                      setState(() {
                        if (value) {
                          alunoSelecionado = value ? c : null;
                        }
                      });
                    },
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          bool isAlunoExcedeMatriculas = false;
          bool isCursoExceMatriculas = false;
          String mensagem = '';

          if (alunoSelecionado == null || cursoSelecionado == null) {
            isAlunoExcedeMatriculas = true;
            mensagem = 'Oops! Selcione o aluno e o curso!';
          }

          if (alunoSelecionado!.cursos.length > 2) {
            isAlunoExcedeMatriculas = true;
            mensagem = 'Limite máximo de matriculas por aluno.';
          }

          if (cursoSelecionado!.alunos.length > 9) {
            isCursoExceMatriculas = true;
            mensagem = 'Limite máximo de matriculas por curso.';
          }

          if (isAlunoExcedeMatriculas || isCursoExceMatriculas) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(mensagem),
                duration: const Duration(seconds: 2),
              ),
            );
          } else {
            alunoController.salvarMatricula(
                alunoSelecionado!, cursoSelecionado!);
          }
        },
        label: const Text('MATRICULAR'),
      ),
    );
  }
}
