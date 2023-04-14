import 'package:flutter/material.dart';
import 'package:vrsoft_test_inovar/app/entities/curso_entity.dart';
import 'package:vrsoft_test_inovar/app/modules/aluno/aluno_controller.dart';
import 'package:vrsoft_test_inovar/app/modules/aluno/aluno_repository.dart';
import 'package:vrsoft_test_inovar/app/modules/aluno/alunos_page.dart';
import 'package:vrsoft_test_inovar/app/modules/curso/curso_controller.dart';
import 'package:vrsoft_test_inovar/app/modules/curso/curso_repository.dart';
import 'package:vrsoft_test_inovar/app/modules/curso/pages/curso_matricula.dart';
import 'package:vrsoft_test_inovar/app/modules/curso/pages/cursos_page.dart';
import 'package:vrsoft_test_inovar/main.dart';
import 'package:vrsoft_test_inovar/objectbox_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.objectBox});

  final ObjectBox objectBox;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CursoRepository cursoRepository;
  late CursoController cursoController;
  late AlunoRepository alunoRepository;
  late AlunoController alunoController;

  int _index = 0;
  late List<Curso> cursos;

  @override
  void initState() {
    cursoRepository = CursoRepository(objectbox.store);
    cursoController = CursoController(cursoRepository);
    alunoRepository = AlunoRepository(objectbox.store);
    alunoController = AlunoController(alunoRepository);

    cursoController.carregar();
    alunoController.carregar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      // appBar: AppBar(title: const Text('Home')),
      body: IndexedStack(
        index: _index,
        children: [
          CursosPage(
              cursoController: cursoController,
              alunoController: alunoController),
          AlunosPage(controller: alunoController),
          CursoMatricula(
              alunoController: alunoController,
              cursoController: cursoController),
          // Container(color: Colors.blue),
          // Container(color: Colors.green),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        elevation: 2,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.feed_outlined),
            activeIcon: Icon(Icons.feed),
            label: 'Cursos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            activeIcon: Icon(Icons.favorite),
            label: 'Alunos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_outlined),
            activeIcon: Icon(Icons.list),
            label: 'Matriculas',
          )
        ],
      ),
    );
  }
}
