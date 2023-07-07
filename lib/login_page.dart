import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset(
                '../assets/login.png',
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Column(
                  children: [ 
                    TextFormField(
                      validator: (value) {
                        if(value?.isEmpty == true){
                          return "Enter username";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: "Enter you mail",
                          label: Text('username'),
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      validator: (value) {
                        if(value?.isEmpty == true){
                          return "Enter password";
                        }
                        else if( value != null && value.length<6){
                          return "password length atleast 6 ";
                        }

                        return null;
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Enter you password",
                          label: Text('password'),
                          border: OutlineInputBorder()),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
                onPressed: () {
                  if(_formkey.currentState?.validate() == true){
                  Navigator.of(context).push(MaterialPageRoute(
                    
                    builder: (context) {
                      return const HomePage();
                    },
                  ));
                  };
                },
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
