import 'package:flutter_modular/flutter_modular.dart';
import 'package:vrsoft_test_inovar/app/modules/aluno/aluno_controller.dart';
import 'package:vrsoft_test_inovar/app/modules/aluno/aluno_repository.dart';
import 'package:vrsoft_test_inovar/app/modules/aluno/alunos_page.dart';
import 'package:vrsoft_test_inovar/app/modules/curso/pages/aluno_form.dart';

class AlunoModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => AlunoRepository(i.get())),
        Bind((i) => AlunoController(i.get()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const AlunosPage(),
        ),
        ChildRoute('/novo', child: (context, args) => const AlunoForm()),
      ];
}
