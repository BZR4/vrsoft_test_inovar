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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cursos'),
      ),
      body: ListView(children: [
        GestureDetector(
            onTap: () => Modular.to.navigate('/cursos/'),
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                leading: Icon(
                  FontAwesomeIcons.personChalkboard,
                  size: 50,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                title: const Text('Cursos'),
                subtitle: const Text('Confira os cursos dispoíveis'),
              ),
            )),
        GestureDetector(
          onTap: () => Modular.to.navigate('/alunos/'),
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Icon(
                FontAwesomeIcons.users,
                size: 50,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              title: const Text('Alunos'),
              subtitle:
                  const Text('Confira os alunos da plataforma dispoíveis'),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Modular.to.navigate('/cursos/matriculas'),
          child: Card(
            child: ListTile(
              leading: Icon(
                FontAwesomeIcons.solidAddressBook,
                size: 50,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              title: const Text('Matrículas'),
              subtitle:
                  const Text('Gestão de matrículas para os cursos dispoíveis'),
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
