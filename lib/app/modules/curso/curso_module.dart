import 'package:flutter_modular/flutter_modular.dart';
import 'package:vrsoft_test_inovar/app/modules/curso/curso_controller.dart';
import 'package:vrsoft_test_inovar/app/modules/curso/pages/curso_form.dart';
import 'package:vrsoft_test_inovar/app/modules/curso/curso_repository.dart';
import 'package:vrsoft_test_inovar/app/modules/curso/pages/cursos_page.dart';

import '../aluno/aluno_controller.dart';
import '../aluno/aluno_repository.dart';
import 'pages/curso_matricula.dart';

class CursoModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => CursoRepository(i.get())),
        Bind((i) => CursoController(i.get())),
        Bind((i) => AlunoRepository(i.get())),
        Bind((i) => AlunoController(i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => const CursosPage()),
        ChildRoute('/novo', child: (context, args) => const CursoForm()),
        ChildRoute('/matriculas',
            child: (context, args) => const CursoMatricula()),
      ];
}
