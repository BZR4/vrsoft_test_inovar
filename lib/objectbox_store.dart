import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:vrsoft_test_inovar/app/entities/aluno_entity.dart';
import 'package:vrsoft_test_inovar/app/entities/curso_entity.dart';
import 'package:vrsoft_test_inovar/objectbox.g.dart';

class ObjectBoxStore {
  late final Store _store;

  static final ObjectBoxStore _singleton = ObjectBoxStore._();

  ObjectBoxStore._();

  static ObjectBoxStore get instance => _singleton;

  Future<Store> init() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final pathDocumentDirectory = p.join(documentDirectory.path, 'db');
    _store = await openStore(directory: pathDocumentDirectory);

    return _store;
  }

  Box<Aluno> get boxAluno => _store.box<Aluno>();
  Box<Curso> get boxCurso => _store.box<Curso>();

  get store => _store;
}
