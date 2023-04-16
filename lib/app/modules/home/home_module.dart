import 'package:flutter_modular/flutter_modular.dart';
import 'package:vrsoft_test_inovar/app/modules/aluno/aluno_module.dart';
import 'package:vrsoft_test_inovar/app/modules/curso/curso_module.dart';
import 'package:vrsoft_test_inovar/app/modules/home/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const HomePage(),
    ),
    ModuleRoute('/cursos', module: CursoModule()),
    ModuleRoute('/alunos', module: AlunoModule()),
  ];
}
