import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vrsoft_test_inovar/app/shared/widgets/custom_card_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cursos'),
      ),
      body: ListView(children: [
        GestureDetector(
            onTap: () => Modular.to.navigate('/cursos/'),
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/curso_reduzido.png',
                    fit: BoxFit.fitHeight,
                  ),
                  const ListTile(
                    title: Text('Cursos'),
                    subtitle: Text('Confira os cursos dispoíveis'),
                  ),
                ],
              ),
            )),
        GestureDetector(
          onTap: () => Modular.to.navigate('/alunos/'),
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/aluno_reduzido.png',
                  fit: BoxFit.fitHeight,
                ),
                const ListTile(
                  title: Text('Alunos'),
                  subtitle: Text('Confira os alunos da plataforma dispoíveis'),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Modular.to.navigate('/cursos/matriculas'),
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/matricula_reduzido.png',
                  fit: BoxFit.fitHeight,
                ),
                const ListTile(
                  title: Text('Matrículas'),
                  subtitle:
                      Text('Gestão de matrículas para os cursos dispoíveis'),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   var size = MediaQuery.of(context).size;

  //   return Scaffold(
  //     // appBar: AppBar(title: const Text('Home')),
  //     body: IndexedStack(
  //       index: _index,
  //       children: [
  //         CursosPage(
  //             cursoController: cursoController,
  //             alunoController: alunoController),
  //         AlunosPage(controller: alunoController),
  //         CursoMatricula(
  //             alunoController: alunoController,
  //             cursoController: cursoController),
  //         // Container(color: Colors.blue),
  //         // Container(color: Colors.green),
  //       ],
  //     ),
  //     bottomNavigationBar: BottomNavigationBar(
  //       currentIndex: _index,
  //       onTap: (index) {
  //         setState(() {
  //           _index = index;
  //         });
  //       },
  //       elevation: 2,
  //       items: const [
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.feed_outlined),
  //           activeIcon: Icon(Icons.feed),
  //           label: 'Cursos',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.person_outlined),
  //           activeIcon: Icon(Icons.person),
  //           label: 'Alunos',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.list_outlined),
  //           activeIcon: Icon(Icons.list),
  //           label: 'Matriculas',
  //         )
  //       ],
  //     ),
  //   );
  // }
}
