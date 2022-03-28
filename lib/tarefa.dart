class Tarefa {
  final String nome;
  final DateTime data;
  bool concluido;

  Tarefa(this.nome, {this.concluido = false}) : data = DateTime.now();
}
