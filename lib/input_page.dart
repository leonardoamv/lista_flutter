import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GlobalKey<FormState> form = GlobalKey();
  late TextEditingController todoController;

  @override
  void initState() {
    todoController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digite sua tarefa'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: form,
          child: Column(
            children: [
              TextFormField(
                controller: todoController,
                validator: (value) {
                  if ((value ?? '').isEmpty) {
                    return 'Escreve algo burro';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: salvarTODO,
                  child: const Text('Salvar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void salvarTODO() {
    if (form.currentState?.validate() == true) {
      print('Tudo certo, atividade salva');
      Navigator.pop(context, todoController.text);
    }
  }
}
