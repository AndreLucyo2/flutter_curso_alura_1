import 'package:flutter/material.dart';
import 'package:alura_flutter_curso_1/componentes/task.dart';

//pode manipular informações...

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    const Task('Andar de Bike', 'assets/images/02.png', 10),
    const Task('Ler', 'assets/images/03.jpg', 3),
    const Task('Meditar', 'assets/images/04.jpg', 50),
    const Task('Jogar', 'assets/images/02.png', 5)
  ];

  void newTask(String name, String photo, int difficulty) {
    //Adiciona uma nova tarefa na lista
    taskList.add(Task(
      name,
      photo,
      difficulty,
    ));
  }

  static TaskInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskInherited>();
  }

//Da a habilidade de validar e comparar o estado anterior de uma variável
  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    //Compara e retorna um bolleano
    return oldWidget.taskList.length != taskList.length;
  }
}
