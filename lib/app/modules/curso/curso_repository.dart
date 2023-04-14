import 'package:objectbox/objectbox.dart';
import '../../entities/curso_entity.dart';

class CursoRepository {
  final Store store;

  CursoRepository(this.store);

  Box<Curso> get boxCurso => store.box<Curso>();

  Future<Curso?> save(String descricao, String ementa) async {
    var curso = Curso(descricao: descricao, ementa: ementa);
    var id = boxCurso.put(curso);
    return boxCurso.get(id);
  }

  Future<List<Curso>> getAll() async {
    return boxCurso.getAll();
  }
}
