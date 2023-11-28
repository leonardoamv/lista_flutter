import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> todoList = [
    'Estudar Flutter',
    'Revisar aulas',
    'Entregar as atividades',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App TODO'),
        backgroundColor: Colors.greenAccent,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) =>
            const Divider(thickness: 2, height: 2),
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          String item = todoList[index];
          return ListTile(
            leading: Text((index + 1).toString()),
            title: Text(' -  $item'),
            subtitle: Text(item),
            trailing: const Icon(Icons.access_alarm),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: irParaTelaDeInput,
        child: const Icon(Icons.add),
      ),
    );
  }

  void irParaTelaDeInput() async {
    String? todo = await Navigator.of(context).pushNamed('/input') as String?;
    if (todo != null) {
      setState(() {
        todoList.add(todo);
      });
    }
  }
}
