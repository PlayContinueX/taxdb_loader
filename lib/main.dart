import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:taxdb_loader/listile_item.dart';
import 'package:taxdb_loader/provider_manager.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeViewModel()),
  ], child: const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    var viewmodel = context.watch<ThemeViewModel>();
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: viewmodel.seedColor,
              brightness: viewmodel.brightness,
            )),
        home: const MainApp(),
      ),
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
        endDrawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.5,
          child: ListView(
            children: List.generate(
                10,
                (index) => ListTile(
                      title: Center(child: text_list[index]),
                      leading: index == 0 ? null : icon_list[index],
                      onTap: index == 0 ? null : (() {}),
                    )),
          ),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text('_countProvider.count.toString()'),
            ElevatedButton(onPressed: () {}, child: const Text('UP')),
            ElevatedButton(onPressed: () {}, child: const Text('Down')),
          ]),
        ),
      ),
    );
  }
}

class ThemeAppBar {
  static AppBar getAppBar(BuildContext context) {
    var viewmodel = context.watch<ThemeViewModel>();
    return AppBar(
      actions: [
        Row(
          children: kThemeSeedColors
              .map((e) => _buildSeedColorButton(e, context))
              .toList(),
        ),
        const SizedBox(width: 10),
        CupertinoSwitch(
          value: viewmodel.brightness == Brightness.light,
          onChanged: (value) {
            viewmodel.brightness = value ? Brightness.light : Brightness.dark;
          },
          activeColor: Theme.of(context).colorScheme.primary,
          trackColor: Theme.of(context).colorScheme.primary.withOpacity(0.5),
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  static Widget _buildSeedColorButton(Color color, BuildContext context) {
    var viewmodel = context.watch<ThemeViewModel>();
    return GestureDetector(
      onTap: () {
        viewmodel.seedColorIndex = kThemeSeedColors.indexOf(color);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0),
        child: CircleAvatar(
          radius: 16,
          backgroundColor: color,
          child: viewmodel.seedColor == color
              ? const Icon(
                  Icons.check,
                  size: 16.0,
                  color: Colors.white,
                )
              : null,
        ),
      ),
    );
  }
}
