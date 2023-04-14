// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';
import 'package:vrsoft_test_inovar/app/entities/aluno_entity.dart';
import 'package:vrsoft_test_inovar/app/entities/curso_entity.dart';
import 'package:vrsoft_test_inovar/app/modules/aluno/aluno_repository.dart';

part 'aluno_controller.g.dart';

class AlunoController = _AlunoControllerBase with _$AlunoController;

abstract class _AlunoControllerBase with Store {
  final AlunoRepository repository;

  _AlunoControllerBase(
    this.repository,
  );

  @observable
  ObservableList<Aluno> alunos = ObservableList<Aluno>();

  @action
  Future<void> salvar(String nome) async {
    repository.save(nome);
    carregar();
  }

  @action
  Future<bool> isLimiteMatricula(Aluno aluno) async {
    return aluno.cursos.length > 2;
  }

  @action
  Future<void> salvarMatricula(Aluno aluno, Curso curso) async {
    repository.saveInCourse(aluno, curso);
    carregar();
  }

  @action
  Future<void> carregar() async {
    alunos.clear();
    alunos.addAll(await repository.getAll());
  }
}
