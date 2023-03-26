import 'package:flutter/material.dart';
import 'package:food_app/Screens/homepage.dart';
import 'package:food_app/Screens/sign_up.dart';
import 'package:food_app/utility/utility.dart';
import '../Services/networking.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: 'Email',
                      prefixIcon: const Icon(Icons.email_outlined),
                    ),
                    controller: emailController,
                  ),
                  const SizedBox(height: 18),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Password';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    controller: passwordController,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            GestureDetector(
              onTap: () {
                setState(() {
                  isLoading = true;
                });
                if (_formKey.currentState!.validate()) {

                  NetWorking.signWithEmailAndPasssword(emailController.text.toString(),
                      passwordController.text.toString())
                      .then((value) => {
                    setState(() {
                      isLoading = false;
                    }),
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage()))
                  })
                      .catchError((e) {
                    Utility().showToastMessage(e.toString());
                    setState(() {
                      isLoading = false;
                    });
                  });
                }
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(25)),
                child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text(
                  'Sign In',
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't Have An Account?",
                  style: TextStyle(fontSize: 15),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUp()));
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
