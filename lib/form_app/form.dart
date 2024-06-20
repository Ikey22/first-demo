import 'package:first_demo/form_app/valid_email.dart';
import 'package:flutter/material.dart';

class FormDemo extends StatefulWidget {
  const FormDemo({super.key});

  @override
  State<FormDemo> createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  final _formKey = GlobalKey<FormState>();
  final isLoading = false;

  void _submit() {
    final isValid = _formKey.currentState?.validate();
    if (isValid!) {
      return;
    }
    _formKey.currentState?.save();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
          title: const Text('Form Demo'),
          backgroundColor: Colors.red,
          actions: [Icon(Icons.menu)]),
      body: SafeArea(
        
        child: Center(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  //form fields
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.normal, color: Colors.grey)),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      validateEmail(value!);
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.normal, color: Colors.grey)),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 10) {
                        return 'Phone number should be more than 10';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.normal, color: Colors.grey)),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 6) {
                        return 'Password must be at least 6 characters long!';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.normal, color: Colors.grey)),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value != _passwordController.text) {
                        return 'Passwords don\'t match';
                      }
                      return null;
                    },
                  ),
                  //Text('Tiu'),
                  OutlinedButton(
                    onPressed: () {
                      _submit();
                      print(_passwordController.text);
                    },
                    child: Text('Submit'),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
