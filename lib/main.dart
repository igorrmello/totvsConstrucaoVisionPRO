import 'package:flutter/material.dart';
import 'package:meugestorobras/base/prjNavigation.service.dart';
import 'package:meugestorobras/base/prjResponsivo.view.dart';
import 'package:meugestorobras/base/prjRouter.view.dart';
import 'package:meugestorobras/style/prjTemaApp.view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestão de Obras',
      onGenerateRoute: AppRouter.generateRoute,
      navigatorKey: NavigationService.instancia.navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Entre no Gestão de Obras'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Responsivo(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TemaCorApp.black,
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Tela de Login aqui!',
            ),
            TextButton(
                onPressed: () {
                  NavigationService.instancia
                      .navigateAsRootTo(AppRouter.mainMasterPage);
                },
                child: const Text("Clique para avançar"))
          ],
        ),
      ),
    );
  }
}
