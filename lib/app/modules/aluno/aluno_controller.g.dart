// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aluno_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AlunoController on _AlunoControllerBase, Store {
  late final _$alunosAtom =
      Atom(name: '_AlunoControllerBase.alunos', context: context);

  @override
  ObservableList<Aluno> get alunos {
    _$alunosAtom.reportRead();
    return super.alunos;
  }

  @override
  set alunos(ObservableList<Aluno> value) {
    _$alunosAtom.reportWrite(value, super.alunos, () {
      super.alunos = value;
    });
  }

  late final _$salvarAsyncAction =
      AsyncAction('_AlunoControllerBase.salvar', context: context);

  @override
  Future<void> salvar(String nome) {
    return _$salvarAsyncAction.run(() => super.salvar(nome));
  }

  late final _$isLimiteMatriculaAsyncAction =
      AsyncAction('_AlunoControllerBase.isLimiteMatricula', context: context);

  @override
  Future<bool> isLimiteMatricula(Aluno aluno) {
    return _$isLimiteMatriculaAsyncAction
        .run(() => super.isLimiteMatricula(aluno));
  }

  late final _$salvarMatriculaAsyncAction =
      AsyncAction('_AlunoControllerBase.salvarMatricula', context: context);

  @override
  Future<void> salvarMatricula(Aluno aluno, Curso curso) {
    return _$salvarMatriculaAsyncAction
        .run(() => super.salvarMatricula(aluno, curso));
  }

  late final _$carregarAsyncAction =
      AsyncAction('_AlunoControllerBase.carregar', context: context);

  @override
  Future<void> carregar() {
    return _$carregarAsyncAction.run(() => super.carregar());
  }

  @override
  String toString() {
    return '''
alunos: ${alunos}
    ''';
  }
}
