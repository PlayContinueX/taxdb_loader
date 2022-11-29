import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taxdb_loader/drawer/custom_drawer.dart';
import 'package:taxdb_loader/main/call_log_contents.dart';
import 'package:taxdb_loader/main/call_memo_contents.dart';
import 'package:taxdb_loader/main/mainContents.dart';

bool isDarkMode = false;
GetStorage getStoreage = GetStorage();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  if (getStoreage.read('isDarkMode') == null) {
    isDarkMode = false;
  } else {
    isDarkMode = getStoreage.read('isDarkMode');
  }
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
        primaryColor: Colors.brown,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        primaryColor: Colors.brown,
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
        body: Column(
          children: [
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.arrow_back_ios),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Theme.of(context).primaryColor)),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.arrow_forward_ios),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Theme.of(context).primaryColor)),
                )
              ],
            ),
            MainContents(),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Call_Log_Contents(),
                Call_Memo_Contents(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AppGlobalVariable {
  static final GlobalKey<NavigatorState> navigatorState =
      GlobalKey<NavigatorState>();
}
