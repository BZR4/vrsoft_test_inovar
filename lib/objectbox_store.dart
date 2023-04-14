import 'package:flutter_modular/flutter_modular.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:vrsoft_test_inovar/objectbox.g.dart';

class ObjectBox extends Disposable {
  late final Store store;

  ObjectBox._create(this.store) {}

  static Future<ObjectBox> create() async {
    final docDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: path.join(docDir.path, 'vrsoft'));

    return ObjectBox._create(store);
  }

  Box<T> getBox<T extends Object>() => store.box();

  @override
  void dispose() {
    store.close();
  }
}
