//import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/src/shared/utils.dart';

class SignIn extends StatefulWidget 
{
  const SignIn({super.key});
  @override
  State<SignIn> createState() => _SignIn();
  
}

class _SignIn extends State<SignIn> 
{
  //final userInput = TextField();
  Map<String, String> users = {
    'cristhian@unah.hn': '20242000001',
    'jeferson@unah.hn': '20242000327',
    'maynor@unah.hn': '20242000002',
    'orlando@unah.hn': '20242000031',
    'ariel@unah.hn': '20242000121',
    'lesly@unah.hn': '20242000041',
    'isaac@unah.hn': '20242000071',
    'moises@unah.hn': '20242000201',
  };

  Color _color = Colors.black;
  final userController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final RegExp userRegex = RegExp(r'^[\w\.-]+@unah\.hn$');
  final RegExp passwordRegex = RegExp(r'^(?=.[!@#$%^&(),.?":{}|<>_]).{6,}$');

  FocusNode userFocus = FocusNode();
  bool _hidePassword = true;
     
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      //backgroundColor: Colors.lightBlue,
        /*appBar: AppBar(
        title: Text('Login', style: TextStyle(color: const Color.fromARGB(218, 3, 49, 58), fontWeight: FontWeight.bold, fontSize: 25)),

        elevation: 10,
        backgroundColor: const Color.fromARGB(218, 24, 133, 155),
        leading: Icon(Icons.person_2_sharp),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: const Color.fromARGB(218, 3, 49, 58),
            ),
          ),
          
          //IconButton(onPressed: () {}, icon: Icon(Icons.verified_user_sharp)),
        ],*/
      //),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: 
        [
          Text("SignIn", style: TextStyle(color: const Color.fromARGB(218, 3, 49, 58), fontWeight: FontWeight.bold, fontSize: 34, letterSpacing: 7)),
          SizedBox(height: 30),
          // Logica del usuario
          Text("Email", style: TextStyle(color: const Color.fromARGB(218, 3, 49, 58), fontWeight: FontWeight.bold, fontSize: 25, letterSpacing: 7)),
          SizedBox(height: 8),
          TextField(
            focusNode: userFocus,
            controller: emailController,
            style: TextStyle(color: _color),
            decoration: InputDecoration(
              //label: Text('User'),
              hint: Text('Example: lismy.ramos@unah.hn'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              //prefixIcon: Icon(Icons.text_fields_rounded),
            ),
            maxLines: 1,
            maxLength: 50,
            obscureText: false,
            keyboardType: TextInputType.text, // Cambiado aquí
          ),

          SizedBox( height: 35),

          Text("Email", style: TextStyle(color: const Color.fromARGB(218, 3, 49, 58), fontWeight: FontWeight.bold, fontSize: 25, letterSpacing: 7)),
          SizedBox(height: 8),
          TextField(
            focusNode: userFocus,
            controller: emailController,
            style: TextStyle(color: _color),
            decoration: InputDecoration(
              //label: Text('User'),
              hint: Text('Example: lismy.ramos@unah.hn'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              //prefixIcon: Icon(Icons.text_fields_rounded),
            ),
            maxLines: 1,
            maxLength: 50,
            obscureText: false,
            keyboardType: TextInputType.text, // Cambiado aquí
          ),

          // Logica de la contraseña
          Text("Password", style: TextStyle(color: const Color.fromARGB(218, 3, 49, 58), fontWeight: FontWeight.bold, fontSize: 25, letterSpacing: 7)),
          SizedBox(height: 8),
          // TextField para la contraseña, debemos considerar que sea minimo de 6 caracteres y que incluya un caracter especial
          TextField(
            controller: passwordController,
            style: TextStyle(color: _color),
            decoration: InputDecoration(
              //label: Text('password'),
              hint: Text('Example: /Messi10'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),

              // Anclaremos un icono al final del TextField, con la funcionalidad de mostrar u ocultar la contraseña
              suffixIcon: IconButton(
                onPressed: ()
                {
                  setState(() 
                  {
                    _hidePassword = !_hidePassword;
                  });
                },
                icon: Icon(
                  _hidePassword 
                    ? Icons.visibility_off_outlined 
                    : Icons.visibility_outlined,
                ),
              ),
            ),
            maxLines: 1,
            maxLength: 20,
            
            obscureText: _hidePassword,
            keyboardType: TextInputType.visiblePassword, // Cambiado aquí
          ),

          // Boton para iniciar sesión, al presionarlo debe validar que los campos sean correctos tal como se indico anteriormente
          TextButton(
            onPressed: () 
            {
              for (var element in users.entries) 
              {
                if (element.key == userController.text) // En caso de cumplir con los requerimientos
                {
                  if (element.value == passwordController.text) 
                  {
                    print("Sign up exitoso");
                    print("Usuario: ${emailController.text}");
                    print("Contraseña: ${passwordController.text}");

                    //context.pop();
                    context.go('/todos');
                    break;
                  }
                }
              }
                // Mostramos los bordes del TextField en rojo e indicamos los posibles errores del usuario
                setState(() 
                {
                  _color = Colors.red;
                  
                  Utils.showSnackBar(
                    context: context, 
                    title: "Email or password are incorrect",
                    color: Colors.red,
                  );

                  //userController.selection.;
                });
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 6),
              backgroundColor: Color.fromARGB(255, 134, 125, 108),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
          
          ), 
            child: Text('Login', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 255, 255, 255))),
      ),
      SizedBox(height: 20),
      Text("You don't have an account yet? Create your account", style: TextStyle(color: const Color.fromARGB(218, 3, 49, 58), fontWeight: FontWeight.bold, fontSize: 16)),
      TextButton(onPressed: (){}, child: Text('here.', style: TextStyle(color: Colors.blue, fontSize: 16))),
      ],
      ),
    );
  }
}

/* Para el Login

*/