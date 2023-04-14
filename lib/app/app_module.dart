import 'package:flutter_modular/flutter_modular.dart';
import 'package:objectbox/objectbox.dart';
import 'package:vrsoft_test_inovar/app/modules/curso/curso_controller.dart';
import 'package:vrsoft_test_inovar/app/modules/curso/curso_repository.dart';
import 'package:vrsoft_test_inovar/app/modules/home/home_page.dart';
import 'package:vrsoft_test_inovar/objectbox.g.dart';
import 'package:vrsoft_test_inovar/objectbox_store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    // Bind.singleton((i) => ObjectBox.create()),
    // Bind.singleton((_) => Box<Aluno>(Modular.get<ObjectBox>().store)),
    // Bind.singleton((_) => Box<Curso>(Modular.get<ObjectBox>().store)),
    // Bind((i) => ObjectBox.create(), isLazy: false),
    // Bind.singleton<Future<Store>>(
    //     (i) => i.get<Future<ObjectBox>>().then((value) => value.store)),
    // Bind((i) => CursoRepository(i.get())),
    // Bind((i) => AlunoRepository(i.get())),
    // Bind<AlunoController>((i) => AlunoController(i.get())),
    // Bind<CursoController>((i) => CursoController(i.get())),
  ];

  // @override
  // List<ModularRoute> get routes =>
  // [ChildRoute('/', child: (context, args) => const HomePage())];
}
