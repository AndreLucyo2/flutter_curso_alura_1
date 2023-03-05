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
        child: SingleChildScrollView(
          child: Container(
            height: 540,
            width: 340,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 3, color: Colors.blueGrey),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    keyboardType: TextInputType.number,
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
                    keyboardType: TextInputType.url,
                    onChanged: (text) {
                      //Caso mudar, faz reload da tela
                      setState(() {});
                    },
                    controller: imageController,
                    //Fica verificando se algo mudou no campo
                    textAlign: TextAlign.left,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Imagem',
                      fillColor: Colors.white70,
                      filled: true,
                    ),
                  ),
                ),
                //Imagem em tempo real:
                Container(
                  height: 100,
                  width: 72,
                  //Decoração do espaço da imagem
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: Colors.black12,
                    ),
                  ),
                  //Imagem:
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      imageController.text,
                      //Tratamento de erro no carregamento da imagem:
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        //em caso de erro retorna uma imagem específica:
                        return Image.asset('assets/images/00_nophoto.png');
                      },
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ElevatedButton(
                  child: const Text('Adicionar'),
                  onPressed: () {
                    // print(nameController.text);
                    // print(int.parse(difficultController.text));
                    // print(imageController.text);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
