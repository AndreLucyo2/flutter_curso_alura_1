import 'package:alura_flutter_curso_1/task.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//Controla a opacidade das tarefas:
  bool opacidade = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tarefas'),
          leading: Container(),
        ),
        body: AnimatedOpacity(
          //ativa ou desativa a opacidade
          opacity: opacidade ? 1 : 0,
          duration: const Duration(microseconds: 10000),
          child: ListView(
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 8),
                //obtem a imagem da internet
                child: Tasks(
                    'Estudar Flutter',
                    'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                    2),
              ),
              Tasks(
                  'Andar de Bike',
                  'http://4.bp.blogspot.com/-3YwFT7wiDnE/VT5NLGC20qI/AAAAAAABC8Y/tQcMBoQkbEk/s1600/adffb142a07755f9fc4e1400e3491ae32.jpg',
                  10),
              Tasks(
                  'Ler',
                  'https://i.pinimg.com/originals/e4/34/2a/e4342a4e0e968344b75cf50cf1936c09.jpg',
                  3),
              Tasks(
                  'Meditar',
                  'https://img.elo7.com.br/product/main/3D91478/arquivo-digital-100-imagens-super-mario-png-alta-resolucao-png.jpg',
                  50),
              Tasks('Jogar',
                  'https://www.rbsdirect.com.br/imagesrc/35689144.jpg?w=700', 5)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              opacidade = !opacidade;
            });
          },
          child: const Icon(Icons.remove_red_eye),
        ),
      ),
    );
  }
}
