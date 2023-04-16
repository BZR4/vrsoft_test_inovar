import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vrsoft_test_inovar/app/entities/curso_entity.dart';
import 'package:vrsoft_test_inovar/app/modules/curso/curso_controller.dart';
import 'package:vrsoft_test_inovar/app/modules/curso/pages/curso_page.dart';
import 'package:vrsoft_test_inovar/app/shared/utils/texto_utils.dart';
import 'package:vrsoft_test_inovar/app/shared/widgets/custom_card_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CursosPage extends StatefulWidget {
  const CursosPage({super.key});

  @override
  State<CursosPage> createState() => _CursosPageState();
}

class _CursosPageState extends State<CursosPage> {
  late final CursoController cursoController;

  @override
  void initState() {
    cursoController = Modular.get<CursoController>();
    cursoController.carregar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cursos'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Modular.to.navigate('/');
          },
        ),
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
        onPressed: () => Modular.to.navigate('/cursos/novo'),
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
