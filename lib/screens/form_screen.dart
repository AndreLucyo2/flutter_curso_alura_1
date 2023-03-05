import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  //Controller dos campos: obtem os inputs do form
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova tarefa'),
      ),
      //Cria e centraliza
      body: Center(
        child: Container(
          height: 540,
          width: 340,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 3, color: Colors.blueGrey),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: nameController,
                  textAlign: TextAlign.left,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Nome',
                      fillColor: Colors.white70,
                      filled: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: difficultController,
                  textAlign: TextAlign.left,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Dificuldade',
                      fillColor: Colors.white70,
                      filled: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: imageController,
                  textAlign: TextAlign.left,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Imagem',
                      fillColor: Colors.white70,
                      filled: true),
                ),
              ),
              ElevatedButton(
                child: const Text('Adicionar'),
                onPressed: () {
                  print(nameController.text);
                  print(int.parse(difficultController.text));
                  print(imageController.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
