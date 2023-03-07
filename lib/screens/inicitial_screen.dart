import 'package:alura_flutter_curso_1/componentes/task.dart';
import 'package:alura_flutter_curso_1/data/task_inherited.dart';
import 'package:alura_flutter_curso_1/screens/form_screen.dart';
import 'package:flutter/material.dart';

class InicitialScreen extends StatefulWidget {
  const InicitialScreen({super.key});

  @override
  State<InicitialScreen> createState() => _InicitialScreenState();
}

class _InicitialScreenState extends State<InicitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Tarefas'),
        leading: Container(),
      ),
      body: ListView(
        //invocando a herança de dados e passando o contexto:
        children: TaskInherited.of(context)!.taskList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FormScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
