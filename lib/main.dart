import 'package:fast8_test/di/injection.dart';
import 'package:fast8_test/presentation/pages.dart';
import 'package:fast8_test/utils/firebase_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseUtils.init();
  await configureDependencies();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Fast8 Test",
      initialRoute: Pages.initial,
      getPages: Pages.routes,
    );
  }
}
