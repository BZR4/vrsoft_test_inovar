// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:objectbox/objectbox.dart';
import 'package:vrsoft_test_inovar/app/entities/curso_entity.dart';
import '../../entities/aluno_entity.dart';

class AlunoRepository {
  final Store store;

  AlunoRepository(this.store);

  Box<Aluno> get boxAluno => store.box<Aluno>();

  Future<Aluno?> save(String nome) async {
    var aluno = Aluno(nome: nome);
    var id = boxAluno.put(aluno);
    return boxAluno.get(id);
  }

  Future<Aluno?> saveInCourse(Aluno aluno, Curso curso) async {
    aluno.cursos.add(curso);
    var id = boxAluno.put(aluno);
    return boxAluno.get(id);
  }

  Future<List<Aluno>> getAll() async {
    return boxAluno.getAll();
  }
}
