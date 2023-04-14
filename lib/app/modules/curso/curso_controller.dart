import 'package:mobx/mobx.dart';
import 'package:vrsoft_test_inovar/app/entities/curso_entity.dart';
import 'package:vrsoft_test_inovar/app/modules/curso/curso_repository.dart';

part 'curso_controller.g.dart';

class CursoController = _CursoControllerBase with _$CursoController;

abstract class _CursoControllerBase with Store {
  final CursoRepository repository;

  _CursoControllerBase(this.repository);

  @observable
  ObservableList<Curso> cursos = ObservableList<Curso>();

  @action
  Future<void> salvar(String descricao, String ementa) async {
    repository.save(descricao, ementa);
    carregar();
  }

  @action
  Future<void> carregar() async {
    cursos.clear();
    cursos.addAll(await repository.getAll());
  }
}
