import 'package:objectbox/objectbox.dart';
import './curso_entity.dart';

@Entity()
class Aluno {
  @Id()
  int id;
  String nome;

  final cursos = ToMany<Curso>();

  Aluno({
    this.id = 0,
    required this.nome,
  });

  @override
  String toString() => 'Aluno(id: $id, nome: $nome)';
}
