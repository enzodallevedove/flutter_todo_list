import 'package:flutter/material.dart';
import 'package:lista_tarefas_app/tarefa.dart';

void main() {
  runApp(const ListaTarefasApp());
}

class ListaTarefasApp extends StatelessWidget {
  const ListaTarefasApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Tutorial', home: ListaScreen());
  }
}

class ListaScreen extends StatefulWidget {
  const ListaScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ListaScreenState();
  }
}

class ListaScreenState extends State<ListaScreen> {
  final List<Tarefa> tarefas = List.empty(growable: true);
  TextEditingController controller = TextEditingController();

  void adicionaTarefa(String nome) {
    setState(() {
      tarefas.add(Tarefa(nome));
    });

    controller.clear();
  }

  Widget getItem(Tarefa tarefa) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              setState(() {
                tarefa.concluido = true;
              });
            },
            icon: Icon(
              tarefa.concluido
                  ? Icons.check_box
                  : Icons.check_box_outline_blank,
              color: Colors.green,
            ),
            iconSize: 42.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(tarefa.nome), Text(tarefa.data.toIso8601String())],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Lista de Tarefas  ')),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller,
                  onSubmitted: adicionaTarefa,
                ),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: tarefas.length,
                itemBuilder: (context, indice) {
                  return getItem(tarefas[indice]);
                },
              ))
            ]));
  }
}
