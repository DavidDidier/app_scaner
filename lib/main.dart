import 'package:app_scaner/providers/provider_list_scan.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';
import 'pages/map_page.dart';
import 'providers/provider_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UIProvider()),
        ChangeNotifierProvider(create: (_) => ProviderListScan())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lector QR',
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomePage(),
          'map': (_) => const MapPage()
        },
        theme: ThemeData(
            primaryColor: Colors.greenAccent,
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.greenAccent)),
      ),
    );
  }
}
