import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/src/shared/utils.dart';

class signIn extends StatefulWidget 
{
  const signIn({super.key});
  @override
  State<signIn> createState() => _signIn();
}

class _signIn extends State<signIn> 
{
  Map<String, String> users = 
  {
    'cristhian@unah.hn': '20242000001',
    'jeferson@unah.hn': '20242000327',
    'maynor@unah.hn': '20242000002',
    'orlando@unah.hn': '20242000031',
    'ariel@unah.hn': '20242000121',
    'lesly@unah.hn': '20242000041',
    'isaac@unah.hn': '20242000071',
    'moises@unah.hn': '20242000201',
  };

  Color _color = Colors.black; // Propiedad para cambiar el color de los bordes y textos de los TextField en caso de error

  final userController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final RegExp userRegex = RegExp(r'^[\w\.-]+@unah\.hn$');
  final RegExp passwordRegex = RegExp(r'^(?=.[!@#$%^&(),.?":{}|<>_]).{6,}$');

  FocusNode userFocus = FocusNode();
  bool _hidePassword = true;
  bool _hideConfirmPassword = true;
     
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      body: Column
      (
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: 
        [
          Text("SignIn", style: TextStyle(color: const Color.fromARGB(218, 3, 49, 58), fontWeight: FontWeight.bold, fontSize: 34, letterSpacing: 7)),
          SizedBox(height: 35),
          // Logica del usuario
          Text("User Name", style: TextStyle(color: const Color.fromARGB(218, 3, 49, 58), fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 7)),
          SizedBox(height: 8),
          
          Container
          (
            width: 300,
            child: Utils.buildTextField
            (
              //focusNode: userFocus,
              controller: userController,
              hintText: 'Example:',
              labelText: 'User Name',
              borderColor: _color,
              textColor: _color,
            )
          ),
          SizedBox( height: 35),

          // Logica del email
          Text("Emai", style: TextStyle(color: const Color.fromARGB(218, 3, 49, 58), fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 7)),
          SizedBox(height: 8),
          Container
          (
            width: 400,
            child: Utils.buildTextField
            (
              //focusNode: userFocus,
              controller: emailController,
              hintText: 'Example: lesly.lopez@unah.hn',
              labelText: 'Email',
              borderColor: _color,
              textColor: _color,
            )
          ),
          SizedBox( height: 35),

          // Logica de la contraseña
          Text("Password", style: TextStyle(color: const Color.fromARGB(218, 3, 49, 58), fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 7)),
          SizedBox(height: 8),
          Container
          (
            width: 400,
            child: Utils.buildTextField
            (
              //focusNode: userFocus,
              controller: passwordController,
              hintText: 'Example: 12345678901',
              labelText: 'Password',
              borderColor: _color,
              textColor: _color,
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
            )
          ),
          SizedBox( height: 35),
          Text("Rewrite The Password Again", style: TextStyle(color: const Color.fromARGB(218, 3, 49, 58), fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 7)),
          SizedBox(height: 8),
          Container
          (
            width: 400,
            child: Utils.buildTextField
            (
              //focusNode: userFocus,
              controller: confirmPasswordController,
              hintText: 'Example: 12345678901',
              labelText: 'Rewrite The Password Again',
              borderColor: _color,
              textColor: _color,
              suffixIcon: IconButton(
                onPressed: ()
                {
                  setState(() 
                  {
                    _hideConfirmPassword = !_hideConfirmPassword;
                  });
                },
                icon: Icon(
                  _hideConfirmPassword 
                    ? Icons.visibility_off_outlined 
                    : Icons.visibility_outlined,
                ),
              ),
            )
          ),
          SizedBox( height: 35),

          // Logica para registrarse
          TextButton
          (
            onPressed: () 
            {
              if (passwordController.text == confirmPasswordController.text && passwordController.text.isNotEmpty) 
              {
                for (var element in users.keys) 
                {
                  if (element == userController.text) 
                  {
                    print("Sign up erroneo, tal parece que el usuario ya existe");
                    Utils.showSnackBar(
                      context: context, 
                      title: "El usuario ya existe",
                      color: Colors.red,
                    );
                    return;
                  }
                  //bool userExists = users.containsKey(userController.text);
                }

                //print("Sign up exitoso");
                //print("Usuario: ${userController.text}");
                //print("Contraseña: ${passwordController.text}");

                context.go('/todos');
                
              }
              

              //if (element == userController.text || passwordController.text != confirmPasswordController.text) // En caso de cumplir con los requerimientos
              //{
               // print("Sign up erroneo, tal parece que el usuario ya existe");
              //}
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
/*
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
      ),*/
      SizedBox(height: 20),
      Text("Do you have a registered account? Log in", style: TextStyle(color: const Color.fromARGB(218, 3, 49, 58), fontWeight: FontWeight.bold, fontSize: 16)),
      TextButton(onPressed: ()
      {
        context.go('/login');
      }, 
      child: Text('here.', style: TextStyle(color: Colors.blue, fontSize: 16))),
      
              
            
          
        ],
      ),
    );
  }
}