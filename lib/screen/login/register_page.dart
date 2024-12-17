import 'package:easy_localization/easy_localization.dart';
import 'package:f_my_app/data/login_database_helper.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();  String _errorMessage = '';

  Future<void> _register() async {
    String username = _usernameController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

       if (username.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      setState(() {
        _errorMessage =( "register.error.empty".tr());
      });
      return;
    }

       if (password != confirmPassword) {
      setState(() {
        _errorMessage =( "register.error.mismatch".tr());
      });
      return;
    }

       var existingUser =
    await LoginDatabaseHelper.instance.queryUser(username, password);

    if (existingUser.isEmpty) {
           await LoginDatabaseHelper.instance.insertUser({
        'username': username,
        'password': password,
      });

           Navigator.pushReplacementNamed(context, '/login');
    } else {
      setState(() {
        _errorMessage =( "register.error.exist".tr());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("register.register".tr())),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: "register.username".tr()),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: "register.password".tr()),
            ),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(labelText: "register.confirm_password".tr()),            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _register,
              child: Text("register.register".tr()),
            ),
            if (_errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  _errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
