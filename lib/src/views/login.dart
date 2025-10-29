//import 'dart:ffi';
import 'package:flutter/material.dart';

class Login extends StatefulWidget 
{
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final userController = TextEditingController();

  final passwordController = TextEditingController();

  FocusNode userFocus = FocusNode();
    bool _hidePassword = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.lightBlue,
        appBar: AppBar(
        title: Text('Login'),

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
          
          IconButton(onPressed: () {}, icon: Icon(Icons.verified_user_sharp)),
        ],
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            focusNode: userFocus,
            controller: userController,
            decoration: InputDecoration(
              label: Text('User'),
              hint: Text('Example: lismy.ramos@unah.hn'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: Icon(Icons.text_fields_rounded),
            ),
            maxLines: 1,
            maxLength: 50,
            obscureText: false,
            keyboardType: TextInputType.text, // Cambiado aquí
          ),

          SizedBox( height: 35),

          // TextField para la contraseña
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              label: Text('password'),
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
              //suffixIcon: Icon(Icons.vi sibility_outlined),
            ),
            maxLines: 1,
            maxLength: 50,
            
            obscureText: _hidePassword,
            keyboardType: TextInputType.visiblePassword, // Cambiado aquí
          ),
        ],
      ),
    );
  }
}
