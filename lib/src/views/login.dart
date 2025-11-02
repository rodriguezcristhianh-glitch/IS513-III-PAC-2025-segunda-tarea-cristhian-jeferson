import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/src/shared/utils.dart';

class Login extends StatefulWidget 
{
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> 
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

  Color _color = Colors.black;
  final userController = TextEditingController(); 
  
  final passwordController = TextEditingController();
  final RegExp userRegex = RegExp(r'^[\w\.-]+@unah\.hn$');
  final RegExp passwordRegex = RegExp(r'^(?=.*[!@#$%^&*(),.?":{}|<>]).{6,}$');

  FocusNode userFocus = FocusNode();
  bool _hidePassword = true;
     
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.4),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column
              (
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: 
                [
                  Image.asset('assets/images/images.png', width: 150, height: 150),
              
                  Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 34, letterSpacing: 7)),
                  SizedBox(height: 30),
                  Text("Email", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25, letterSpacing: 7)),
                  SizedBox(height: 8),
                  Utils.buildTextField(
                    controller: userController,
                    type: TextInputType.emailAddress,
                    hintText: 'Example: lismy.ramos@unah.hn',
                    labelText: 'Email',
                    borderColor: _color,
                    textColor: _color,
                  ),
              
                  SizedBox(height: 35),
              
                  Text("Password", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25, letterSpacing: 7)),
                  SizedBox(height: 8),
                  Utils.buildTextField(
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    hintText: 'Example: /Messi10',
                    labelText: 'Password',
                    borderColor: _color,
                    textColor: _color,
                    obscureText: _hidePassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
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
              
                  TextButton(
                    onPressed: () 
                    {
                      bool successful_login= false;
                      for (var element in users.entries) 
                      {
                        if (element.key == userController.text)
                        {
                          if (element.value == passwordController.text) 
                          {
                            print("Sign up exitoso");
                            print("Usuario: ${userController.text}");
                            print("Contraseña: ${passwordController.text}");
                            successful_login=true;
                            context.go('/todos');
                            break;
                          }
                        }
                        
                      }
                        if (!successful_login){                  
                        setState(() 
                        {
                          _color = Colors.red;
                        }
                        );
                         Utils.showSnackBar(
                          context: context, 
                          title: "Email or password are incorrect",
                          color: Colors.red,
                         );
                        }
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
              Text("You don't have an account yet? Create your account", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              TextButton(onPressed: ()
              {
                context.go('/signin');
                print("Navegando a la pantalla de registro");
              },
              child: Text('here.', style: TextStyle(color: Colors.blue[200], fontSize: 16))),
              ],
            ),
          ),
          ),
        ],
      )
    );
  }
}