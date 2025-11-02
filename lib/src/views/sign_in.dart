import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/src/shared/utils.dart';

class signIn extends StatefulWidget {
  const signIn({super.key});
  @override
  State<signIn> createState() => _signIn();
}

class _signIn extends State<signIn> {
  Color _color = Colors.black;

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
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final RegExp userRegex = RegExp(r'^[\w\.-]+@unah\.hn$');
  final RegExp passwordRegex = RegExp(r'^(?=.*[!@#$%^&*()/,.?":{}|<>]).{6,}$');

  FocusNode userFocus = FocusNode();
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Container(color: Colors.black.withOpacity(0.4)),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "SignUp",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                      letterSpacing: 7,
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    "First Name",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      letterSpacing: 3,
                    ),
                  ),
                  SizedBox(height: 8),

                  Utils.buildTextField(
                    controller: firstNameController,
                  type: TextInputType.visiblePassword,
                    hintText: 'Example: Lesly',
                    labelText: 'First Name',
                    borderColor: _color,
                    textColor: _color,
                  ),
                  SizedBox(height: 25),
                  Text(
                    "Last Name",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      letterSpacing: 3,
                    ),
                  ),
                  SizedBox(height: 8),

                  Utils.buildTextField(
                    controller: lastNameController,
                    type: TextInputType.visiblePassword,
                    hintText: 'Example: Lopez',
                    labelText: 'Last Name',
                    borderColor: _color,
                    textColor: _color,
                  ),
                  SizedBox(height: 25),
                  Text(
                    "Phone",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      letterSpacing: 3,
                    ),
                  ),
                  SizedBox(height: 8),

                  Utils.buildTextField(
                    controller: phoneController,
                    type: TextInputType.visiblePassword,
                    hintText: 'Example: 88081020',
                    labelText: 'Phone',
                    borderColor: _color,
                    textColor: _color,
                  ),
                  SizedBox(height: 25),

                  Text(
                    "Email",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      letterSpacing: 3,
                    ),
                  ),
                  SizedBox(height: 8),
                  Utils.buildTextField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    hintText: 'Example: lesly.lopez@unah.hn',
                    labelText: 'Email',
                    borderColor: _color,
                    textColor: _color,
                  ),
                  SizedBox(height: 25),

                  Text(
                    "Password",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      letterSpacing: 3,
                    ),
                  ),
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
                  SizedBox(height: 25),

                  TextButton(
                    onPressed: () {
                      bool usuarioYaExiste = false;

                      if (firstNameController.text.isEmpty || 
                          lastNameController.text.isEmpty || 
                          phoneController.text.isEmpty || 
                          emailController.text.isEmpty || 
                          passwordController.text.isEmpty) {
                        setState(() {
                          _color = Colors.red;
                        });
                        Utils.showSnackBar(
                          context: context,
                          title: "All fields are required",
                          color: Colors.red,
                        );
                        return;
                      }

                      if (!userRegex.hasMatch(emailController.text)) {
                        setState(() {
                          _color = Colors.red;
                        });
                        Utils.showSnackBar(
                          context: context,
                          title: "The email address must be @unah.hn",
                          color: Colors.red,
                        );
                        return;
                      }

                      if (!passwordRegex.hasMatch(passwordController.text)) {
                        setState(() {
                          _color = Colors.red;
                        });
                        Utils.showSnackBar(
                          context: context,
                          title: "The password must be at least 6 characters long and include one special character.",
                          color: Colors.red,
                        );
                        return;
                      }

                      for (var element in users.keys) {
                        if (element == emailController.text) {
                          usuarioYaExiste = true;
                          break;
                        }
                      }

                      if (usuarioYaExiste) {
                        print("Sign up erroneo, tal parece que el usuario ya existe");
                        setState(() {
                          _color = Colors.red;
                        });
                        Utils.showSnackBar(
                          context: context,
                          title: "The user already exists",
                          color: Colors.red,
                        );
                      } else {
                        users[emailController.text] = passwordController.text;
                        context.go('/todos');
                      }
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 6,
                      ),
                      backgroundColor: Color.fromARGB(255, 134, 125, 108),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                  
                  SizedBox(height: 20),
                  Text(
                    "Do you have a registered account? Log in",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.go('/login');
                    },
                    child: Text(
                      'here.',
                      style: TextStyle(color: Colors.blue[200], fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}