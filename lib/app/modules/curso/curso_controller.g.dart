// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curso_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CursoController on _CursoControllerBase, Store {
  late final _$cursosAtom =
      Atom(name: '_CursoControllerBase.cursos', context: context);

  @override
  ObservableList<Curso> get cursos {
    _$cursosAtom.reportRead();
    return super.cursos;
  }

  @override
  set cursos(ObservableList<Curso> value) {
    _$cursosAtom.reportWrite(value, super.cursos, () {
      super.cursos = value;
    });
  }

  late final _$salvarAsyncAction =
      AsyncAction('_CursoControllerBase.salvar', context: context);

  @override
  Future<void> salvar(String descricao, String ementa) {
    return _$salvarAsyncAction.run(() => super.salvar(descricao, ementa));
  }

  late final _$carregarAsyncAction =
      AsyncAction('_CursoControllerBase.carregar', context: context);

  @override
  Future<void> carregar() {
    return _$carregarAsyncAction.run(() => super.carregar());
  }

  @override
  String toString() {
    return '''
cursos: ${cursos}
    ''';
  }
}
