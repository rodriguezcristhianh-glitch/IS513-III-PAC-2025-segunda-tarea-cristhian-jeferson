import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Utils 
{
  static TextField buildTextField
  ({
    //required FocusNode focusNode,
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
    Widget? suffixIcon,
    Color borderColor = Colors.black,
    Color textColor = Colors.black,
    String? labelText,
  }) 
  {
    return TextField
    (
      //focusNode: focusNode,
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(color: textColor),
      decoration: InputDecoration
      (
        label: labelText != null ? Text(labelText) : null,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: borderColor, width: 2),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }


  static showSnackBar({required BuildContext context, required String title, Color? color}) 
  {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title), backgroundColor: color));
  }

  static showConfirm({required BuildContext context, void Function()? confirmButton}) async 
  {
    return showDialog<bool>
    (
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirmación'),
          content: Text('Desea realizar esta acción?'),
          actions: 
          [
            TextButton(
              onPressed: confirmButton,
              child: Text('Eliminar', style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () 
              {
                context.pop(false);
              },
              child: Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }
}