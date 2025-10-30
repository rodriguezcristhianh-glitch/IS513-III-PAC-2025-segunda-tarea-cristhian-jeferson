import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/api/todos.dart';
import 'package:todo_app/src/shared/utils.dart';

class AdminTodoPage extends StatelessWidget 
{
  AdminTodoPage({super.key, this.todo});

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
    /*Estás creando una instancia del controlador que luego podrás asignar a un TextField así:
       Por ejemplo: cuando editas una tarea existente, en el código se hace:
       titleController.text = todo!['title'];*/

  FocusNode titleFocus = FocusNode(); /*Permite controlar el foco del teclado (por ejemplo, 
                                        poner automáticamente el cursor en el título o mover el
                                        foco al siguiente campo).*/

  Map<String, dynamic>? todo;          //aqui estara null si estas creandoo uno nuevo

  @override
  Widget build(BuildContext context) {
       //Id que me permite consultar a la BBDD la información actualziada
    final todoId = GoRouterState.of(context).pathParameters['id'];
       //recordemos que cuando el home llamo al 'update-todo' el '3' quedo guardado en el pathParameters

    if (todo != null) {
      titleController.text = todo!['title'];
      descriptionController.text = todo!['description'];
       //Este es en caso de que se este editando
       //los planta en los controladores para que los TextField muestren esos valores.
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          todo == null
              ? 'Creación de una nueva tarea'
              : 'Editando la tarea # $todoId',
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            TextField(
              focusNode: titleFocus,
              controller: titleController,
              decoration: InputDecoration(
                label: Text('Titulo'),
                hint: Text('Eje. Crear opción de eliminar'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),

                // suffixIcon: IconButton(
                //   icon: Icon(Icons.visibility),
                //   onPressed: () {},
                // ),
                prefixIcon: Icon(Icons.text_fields_rounded),
              ),

              maxLines: 1,
              maxLength: 50,
              obscureText: false,
              keyboardType: TextInputType.visiblePassword,
              // style: TextStyle(color: Colors.red),
            ),
            SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              maxLines: 4,
              decoration: InputDecoration(label: Text('Descripción')),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[300],
        
        //TODO: mostrar icono de carga usando gestores de estado
        onPressed: () 
        {
          if (titleController.text.isEmpty) 
          {
            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(
            //     content: Text(
            //       'Debe ingresar un titulo',
            //       style: TextStyle(color: Colors.red[50]),
            //     ),
            //     backgroundColor: Colors.red,
            //   ),
            // );

            Utils.showSnackBar(
              context: context, 
              title: "El titulo es obligatorio",
              color: Colors.red,
            );

            return;                                     //hace return; para no continuar
          }

          //Aquí también usas .text para guardar esos datos dentro del mapa de la nueva tarea 
          final Map<String, dynamic> newTodo = 
          {
            'id': todoList.length + 1,
            'title': titleController.text, 
            'description': descriptionController.text,
            'completed': false,
          };

          if (todoId == null) {
            todoList.add(newTodo);
          } else {
            final indice = todoList.indexWhere(
              (todo) => todo['id'].toString() == todoId, //busca el indiceee del newTODO que coincide
                                                         //con todoList y lo reemplaza (lo edita)
            );

            todoList[indice] = newTodo;
          }

          // final snackBar = SnackBar(
          //   content: const Text('Yay! A SnackBar!'),
          //   action: SnackBarAction(
          //     label: 'Undo',
          //     onPressed: () {
          //       // Some code to undo the change.
          //     },
          //   ),
          // );
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     content: Text('Tarea creada correctamente'),
          //     // backgroundColor: ,
          //     duration: Duration(days: 4),
          //     action: SnackBarAction(label: 'Cerrar', onPressed: () {}),
          //   ),
          // );
          Utils.showSnackBar(
            context: context,
            title: "Tarea creada correctamente",
          );

          titleController.text = '';
          descriptionController.text = '';

          context.pop();
        },
        child: Icon(Icons.add, color: Colors.blue[50]),
      ),
    );
  }
}