import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taxdb_loader/drawer/custom_drawer.dart';
import 'package:taxdb_loader/drawer/custom_enddrawer.dart';
import 'package:taxdb_loader/http/http_get.dart';
import 'package:taxdb_loader/main/call_log_contents.dart';
import 'package:taxdb_loader/main/call_memo_contents.dart';
import 'package:taxdb_loader/main/mainContents.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ko', 'KR')],
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

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text("Taxtis"),
          centerTitle: true,
          leading: IconButton(
              icon: const Icon(Icons.calendar_month),
              onPressed: () {
                if (scaffoldKey.currentState!.isDrawerOpen) {
                  scaffoldKey.currentState!.closeDrawer();
                } else {
                  scaffoldKey.currentState!.openDrawer();
                }
              }),
        ),
        drawer: CustomDrawer(),
        endDrawer: CustomEndDrawer(),
        body: Column(
          children: [
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Fetch_Data();
                  },
                  style: ButtonStyle(
                      foregroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Theme.of(context).primaryColor)),
                  child: const Icon(Icons.arrow_back_ios),
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const Text('1/23'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      foregroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Theme.of(context).primaryColor)),
                  child: const Icon(Icons.arrow_forward_ios),
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
