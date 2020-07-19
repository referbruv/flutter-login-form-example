import 'package:flutter/material.dart';
import 'package:form_login_app/widgets/full_button.dart';
import 'package:form_login_app/widgets/my_form_text_field.dart';
import 'models/form_model.dart';

class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyFormState();
  }
}

class MyFormState extends State<MyForm> {
  // email RegExp
  final _emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  // uniquely identifies a Form
  final _formKey = GlobalKey<FormState>();

  // holds the form data for access
  final model = FormModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Form"),
      ),
      body: Container(
          decoration: BoxDecoration(color: Colors.blue),
          padding: EdgeInsets.all(20.0),
          width: double.infinity,
          child: Container(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: <Widget>[
                Text(
                  "Login Form",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      MyFormTextField(
                        isObscure: false,
                        decoration: InputDecoration(
                          labelText: "EmailAddress",
                          hintText: "me@abc.com",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter an email address';
                          } else if (!_emailRegExp.hasMatch(value)) {
                            return 'Invalid email address!';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          model.emailAddress = value;
                        },
                      ),
                      MyFormTextField(
                        isObscure: true,
                        decoration: InputDecoration(
                            labelText: "Password", hintText: "my password"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          model.password = value;
                        },
                      ),
                      FormSubmitButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, otherwise false.
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            print(model);

                            Scaffold.of(_formKey.currentContext).showSnackBar(
                                SnackBar(content: Text('Processing Data')));
                          }
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
