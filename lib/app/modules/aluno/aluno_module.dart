// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:objectbox/objectbox.dart';
// import 'package:vrsoft_test_inovar/app/entities/aluno_entity.dart';

// import 'aluno_repository.dart';

// part 'aluno_module.g.dart';

// class AlunoModule extends Module {
//   final Store store;

//   AlunoModule({
//     required this.store,
//   });

//   @override
//   final List<Bind> binds = [
//     // Bind.singleton<Future<Box<Aluno>>>(
//     //     (i) => i.get<Future<Store>>().then((value) => value.box<Aluno>())),
//   ];

//   @override
//   final List<ModularRoute> routes = [
//     // ChildRoute('/alunos', child: (_, args) => AlunnosPage()),
//   ];
// }
