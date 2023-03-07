import 'package:alura_flutter_curso_1/data/task_inherited.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  //propriedade para receber um contexto
  final BuildContext taskContext;

  //contrutor que recebe um contexto
  const FormScreen({super.key, required this.taskContext});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  //Controller dos campos: obtem os inputs do form
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  //global: Monitora as validações do form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
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
                      //Validação no input:
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return 'Insira o nome da Tarefa!';
                        }
                        return null;
                      },
                      controller: nameController,
                      textAlign: TextAlign.center,
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
                      //Validação no input:
                      validator: (String? value) {
                        //Valida se esta null ou vazio
                        //o valor precisa ser a partir de 1 até 5
                        if (value!.isEmpty ||
                            int.parse(value) > 5 ||
                            int.parse(value) < 1) {
                          return 'Insira o uma dificuldade entre 1 e 5!';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: difficultController,
                      textAlign: TextAlign.center,
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
                      //Validação no input:
                      validator: (String? value) {
                        //Valida se esta null ou vazio
                        if (value!.isEmpty) {
                          return 'Insira uma url de imagem!';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.url,
                      onChanged: (text) {
                        //Caso mudar, faz reload da tela
                        setState(() {});
                      },
                      controller: imageController,
                      //Fica verificando se algo mudou no campo
                      textAlign: TextAlign.center,
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
                      //Se estiver com um estado válid pode prosseguir
                      if (_formKey.currentState!.validate()) {
                        //Caso seja válido...
                        // print(nameController.text);
                        // print(int.parse(difficultController.text));
                        // print(imageController.text);

                        //Chama o metodo para criar e adicionar nova tarefa:
                        //Recebe um contexto e usao o mesmo do app
                        TaskInherited.of(widget.taskContext)?.newTask(
                          nameController.text,
                          imageController.text,
                          int.parse(difficultController.text),
                        );

                        //Aviso de sucesso: esta no contexto desta tela
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Criando nova tarefa com sucesso!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                        //Retorna para que chamou: para voltar sempre use POP!!!!
                        Navigator.pop(context);
                      } else {
                        //Aviso de erro
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Corrija as informações!'),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
