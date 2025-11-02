import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/api/todos.dart';
import 'package:todo_app/src/shared/utils.dart';
import 'package:todo_app/src/widgets/item_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  CircleAvatar(
                    backgroundColor: Colors.red[50],
                    radius: 40,
                    child: Text(
                      'JA',
                      style: TextStyle(fontSize: 42, color: Colors.red[400]),
                    ),
                  ),
                  Text('User'),
                  Text('mail'),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListTile(
                title: Text('Cerrar Sesion'),
                leading: IconButton(
                  onPressed: () {
                    context.goNamed("login");
                  },
                  icon: Icon(Icons.logout),
                  iconSize: 32,
                ),
              ),
            ),
          ],
        ),
      ),

      appBar: AppBar(title: const Text('TODO-App')),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            confirmDismiss: (direction) async {
              //? Para actualizar
              if (direction == DismissDirection.endToStart) {
                context.pushNamed(
                  'update-todo',
                  pathParameters: {'id': '${todoList[index]['id']}'},
                  extra: todoList[index],
                );
                return false;
              }

              //? Para eliminar
              return await Utils.showConfirm(
                context: context,
                confirmButton: () {
                  todoList.remove(todoList[index]);
                  context.pop(true);
                },
              );
            },
            onDismissed: (direction) {
              //print(direction);
            },
            background: Container(
              padding: EdgeInsets.only(left: 16),
              color: Colors.red,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.delete_outline_rounded,
                  color: Colors.red[50],
                  size: 30,
                ),
              ),
            ),
            secondaryBackground: Container(
              padding: EdgeInsets.only(right: 16),
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Modificar',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[50],
                    ),
                  ),
                  SizedBox(width: 12),
                  Icon(Icons.edit_outlined, color: Colors.blue[50], size: 30),
                ],
              ),
            ),

            key: Key(todoList[index]['id'].toString()),
            child: ItemList(todo: todoList[index]),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[300],
        onPressed: () {
          // navegar a otra pantalla (Navigator 1.0)
          // Navigator.of(context).pushNamed('/admin-todos');
          // context.go('/home/admin-todos');
          context.goNamed('new-todo');
          // context.pushNamed('form');
        },
        child: Icon(Icons.add, color: Colors.blue[50]),
      ),
    );
  }
}
