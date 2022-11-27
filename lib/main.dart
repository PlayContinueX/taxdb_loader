import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taxdb_loader/drawer/bussiness_category.dart';
import 'package:taxdb_loader/drawer/custom_drawer.dart';

bool? isDarkMode = false;
GetStorage getStoreage = GetStorage();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  isDarkMode = getStoreage.read('isDarkMode');
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: AppGlobalVariable.navigatorState,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        primaryColor: Colors.red,
      ),
      themeMode: isDarkMode == true ? ThemeMode.dark : ThemeMode.light,
      home: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Taxtis"),
          centerTitle: true,
        ),
        drawer: CustomDrawer(),
        endDrawer: CustomDrawer(),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text('_countProvider.count.toString()'),
            ElevatedButton(onPressed: () {}, child: const Text('UP')),
            ElevatedButton(
                onPressed: () {
                  print(bussiness_category[0]['midCategory']);
                },
                child: const Text('Down')),
          ]),
        ),
      ),
    );
  }
}

class AppGlobalVariable {
  static final GlobalKey<NavigatorState> navigatorState =
      GlobalKey<NavigatorState>();
}
