import 'package:flutter_modular/flutter_modular.dart';
import 'package:vrsoft_test_inovar/app/modules/curso/curso_module.dart';
import 'package:vrsoft_test_inovar/app/modules/home/home_module.dart';
import 'package:vrsoft_test_inovar/objectbox_store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => ObjectBoxStore.instance),
    AsyncBind((i) => i.get<ObjectBoxStore>().init()),
    // Bind<Future<Store>>(
    //     (i) => i.get<Future<ObjectBoxStore>>().then((value) => value.store)),
  ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
        ModuleRoute('/cursos', module: CursoModule())
      ];
}
