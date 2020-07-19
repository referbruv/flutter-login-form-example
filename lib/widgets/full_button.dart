import 'package:flutter/material.dart';

class FormSubmitButton extends StatelessWidget {
  final Function() onPressed;
  FormSubmitButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: RaisedButton(
          onPressed: onPressed,
          child: Text('Submit'),
        ),
        width: double.infinity);
  }
}
