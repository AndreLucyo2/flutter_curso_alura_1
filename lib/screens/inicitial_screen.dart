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
                'https://www.rbsdirect.com.br/imagesrc/35689144.jpg?w=700', 5),
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
