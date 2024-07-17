import 'package:flutter/material.dart';
import 'package:flutter_validate_test/main.dart';
import 'package:flutter_validate_test/view/login_screen/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    final emailformKey = GlobalKey<FormState>();
    final passwordformKey = GlobalKey<FormState>();
    final confirmPasswordformKey = GlobalKey<FormState>();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                "Sign Up for Free",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
              ),
              SizedBox(height: 45),
              Form(
                key: emailformKey,
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Your Email Address",
                    hintStyle: TextStyle(
                      color: Colors.black38,
                      fontSize: 15.6,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3.3,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3.3,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.contains("@")) {
                      return "Enter a Valid Email";
                    } else if (value.length < 5) {
                      return "Minimum 5 characters";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(height: 25),
              Form(
                key: passwordformKey,
                child: TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: "Your Password",
                    hintStyle: TextStyle(
                      color: Colors.black38,
                      fontSize: 15.6,
                    ),
                    suffixIcon: Icon(
                      Icons.remove_red_eye_rounded,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3.3,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3.3,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter a Valid Password";
                    } else if (value.length < 7) {
                      return "Enter a Strong Password";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(height: 25),
              Form(
                key: confirmPasswordformKey,
                child: TextFormField(
                  obscureText: true,
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    hintText: "Your Confirm Password",
                    hintStyle: TextStyle(
                      color: Colors.black38,
                      fontSize: 15.6,
                    ),
                    suffixIcon: Icon(
                      Icons.remove_red_eye_rounded,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3.3,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3.3,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter a Valid Password";
                    } else if (value.length < 7) {
                      return "Enter a Strong Password";
                    } else if (value != passwordController.text) {
                      return "Incorrect Password";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  if (emailformKey.currentState!.validate() &&
                      passwordformKey.currentState!.validate() &&
                      confirmPasswordformKey.currentState!.validate()) {
                    registerEmail = emailController.text;
                    registerPassword = confirmPasswordController.text;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        margin: EdgeInsets.all(25),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.red,
                        content: Text(
                          "Registration Failed",
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  height: 47,
                  decoration: BoxDecoration(
                    color: Colors.blue[700],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        color: Colors.blue[700],
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
