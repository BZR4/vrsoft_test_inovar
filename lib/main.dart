import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vrsoft_test_inovar/app/app_module.dart';
import 'package:vrsoft_test_inovar/app/app_widget.dart';
import 'package:vrsoft_test_inovar/app/modules/home/home_page.dart';
import 'package:vrsoft_test_inovar/objectbox_store.dart';

late ObjectBox objectbox;

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  // runApp(
  //   ModularApp(
  //     module: AppModule(),
  //     child: const AppWidget(),
  //   ),
  // );

  WidgetsFlutterBinding.ensureInitialized();

  objectbox = await ObjectBox.create();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(objectBox: objectbox),
    );
  }
}
