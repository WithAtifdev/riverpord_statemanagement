import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpord_management/stateNotifierprovider/providers/todo_provider.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final todos = ref.watch(todoProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
      ),

      body: todos.isEmpty ? 
      Center(
        child: Text("No todos yet!"),
      ) :
      ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todoDetail = todos[index];
          return ListTile(
            title: Text(todoDetail.name),
            trailing : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                 IconButton(
                  onPressed: () {
                    ref.read(todoProvider.notifier)
                        .updateTodo(todoDetail.id, "Updated Todo");
                  },
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    ref.read(todoProvider.notifier)
                        .removeTodo(todoDetail.id);
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(todoProvider.notifier)
              .addTodo("Learn Riverpod");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}