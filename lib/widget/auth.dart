import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  String _userEmail = "";
  String _userName = "";
  String _userPassword = "";

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
      margin: EdgeInsets.all(20),
      child: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  key: ValueKey("email"),
                  validator: (val) {
                    if (val!.isEmpty || !val.contains("@")) {
                      return "Please enter a valid email address.";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: "Email address"),
                  onSaved: (val) {
                    _userEmail = val!;
                  },
                ),
                if (_isLogin)
                  TextFormField(
                    key: ValueKey("username"),
                    validator: (val) {
                      if (val!.isEmpty || val.length < 4) {
                        return "Please enter at least 4 characters.";
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: "Username"),
                    onSaved: (val) {
                      _userName = val!;
                    },
                  ),
                TextFormField(
                  key: ValueKey("password"),
                  validator: (val) {
                    if (val!.isEmpty || val.length < 7) {
                      return "Password must be at least 7 characters long.";
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: "Password"),
                  obscureText: true,
                  onSaved: (val) {
                    _userPassword = val!;
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  onPressed: _trySubmit,
                  child: Text(_isLogin ? "Login" : "Signup"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isLogin = !_isLogin;
                    });
                  },
                  child: Text(_isLogin
                      ? "Create new account"
                      : "I alredy have an account"),
                )
              ],
            )),
      )),
    ));
  }
}
