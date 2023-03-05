import 'package:alura_flutter_curso_1/componentes/task.dart';
import 'package:flutter/material.dart';

class InicitialScreen extends StatefulWidget {
  const InicitialScreen({super.key});

  @override
  State<InicitialScreen> createState() => _InicitialScreenState();
}

class _InicitialScreenState extends State<InicitialScreen> {
  //Controla a opacidade das tarefas:
  bool opacidade = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Tarefas'),
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
              child: Tasks('Estudar Flutter', 'assets/images/02.png', 2),
            ),
            Tasks('Andar de Bike', 'assets/images/02.png', 10),
            Tasks('Ler', 'assets/images/03.jpg', 3),
            Tasks('Meditar', 'assets/images/04.jpg', 50),
            Tasks('Jogar', 'assets/images/02.png', 5),
            //Espaço em branco para melhorar a experiencia
            SizedBox(
              height: 70,
            )
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
    );
  }
}
