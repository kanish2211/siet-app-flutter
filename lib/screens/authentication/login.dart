import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:siet_app/riverpods/loginScreenProvider.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 200) {
              return LoginWebView(
                  maxWidth: constraints.maxWidth,
                  maxHeight: constraints.maxHeight);
              ;
            } else {
              return LoginMobileView(
                  maxWidth: constraints.maxWidth,
                  maxHeight: constraints.maxHeight);
            }
          },
        ),
      ),
    );
  }
}

class LoginWebView extends ConsumerStatefulWidget {
  const LoginWebView(
      {Key? key, required this.maxHeight, required this.maxWidth})
      : super(key: key);
  final double maxWidth;
  final double maxHeight;

  @override
  ConsumerState<LoginWebView> createState() => _LoginWebViewState();
}

class _LoginWebViewState extends ConsumerState<LoginWebView> {
  bool reme = false;
  String emailData = "";
  String passwordData = "";
  Map<String, dynamic> responseData = {};
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
          horizontal: widget.maxWidth * 0.29, vertical: widget.maxHeight * 0.1),
      child: Card(
        elevation: 7,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 60),
        child: Column(
          children: [
            Container(
                color: Color.fromARGB(255, 32, 136, 36),
                height: 80,
                width: double.infinity),
            Container(
              child: Padding(
                  padding: EdgeInsets.all(25),
                  child: Consumer(
                    builder: (context, ref, child) {
                      return TextFormField(
                        decoration: const InputDecoration(
                          fillColor: Colors.grey,
                          focusColor: Colors.grey,
                          hintText: "Email",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onChanged: (value) {
                          ref.read(emailProvider.notifier).updateEmail(value);
                        },
                      );
                    },
                  )),
            ),
            Container(
              child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Consumer(
                    builder: (context, ref, child) {
                      return TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          fillColor: Colors.grey,
                          focusColor: Colors.grey,
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onChanged: (value) {
                          ref
                              .read(emailProvider.notifier)
                              .updatePassword(value);
                        },
                      );
                    },
                  )),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Consumer(
                    builder: (context, ref, child) {
                      return Checkbox(
                        value: reme,
                        onChanged: (bool? value) {
                          if (value != null) {
                            onChanged:
                            (value) {
                              ref
                                  .read(emailProvider.notifier)
                                  .updateRememberMe(value);
                            };
                          }
                          ;
                        },
                      );
                    },
                  ),
                  const Text(
                    "Remeber me",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            Container(
              child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 3),
                  child: OutlinedButton(
                    onPressed: () async {
                      final randomData = ref.read(emailProvider);

                      final response = await http.post(
                          Uri.parse("http://10.1.5.201:8000/api/"),
                          headers: {"Content-Type": "application/json"},
                          body: jsonEncode({
                            "email": randomData.email,
                            "password": randomData.password
                          }));
                      responseData = jsonDecode(response.body);
                      print(response.body);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 32, 136, 36)),
                      shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(9)),
                        ),
                      ),
                      side: MaterialStateProperty.all(
                        const BorderSide(
                            color: Color.fromARGB(255, 32, 136, 36), width: 1),
                      ),
                    ),
                    child: const Text(
                      "SIGN IN",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 30, top: 15),
              child: Text(
                "Forgot password ?",
                style: TextStyle(color: Color.fromARGB(255, 32, 136, 36)),
                textAlign: TextAlign.left,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LoginMobileView extends StatefulWidget {
  const LoginMobileView(
      {Key? key, required this.maxHeight, required this.maxWidth})
      : super(key: key);
  final double maxWidth;
  final double maxHeight;

  @override
  LoginMobileViewState createState() => LoginMobileViewState();
}

class LoginMobileViewState extends State<LoginMobileView> {
  bool reme = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(widget.maxWidth * 0.05),
      child: Card(
        elevation: 7,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 60),
        child: Column(
          children: [
            Container(
                color: Color.fromARGB(255, 32, 136, 36),
                height: 80,
                width: double.infinity),
            Container(
              child: Padding(
                padding: EdgeInsets.all(25),
                child: TextFormField(
                  decoration: const InputDecoration(
                    fillColor: Colors.grey,
                    focusColor: Colors.grey,
                    hintText: "Email",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    fillColor: Colors.grey,
                    focusColor: Colors.grey,
                    hintText: "Password",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: reme,
                    onChanged: (bool? value) {
                      if (value != null) {
                        setState(() {
                          reme = value;
                        });
                      }
                    },
                  ),
                  Text(
                    "Remeber me",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 5),
                child: OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 32, 136, 36)),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                      ),
                    ),
                    side: MaterialStateProperty.all(
                      const BorderSide(
                          color: Color.fromARGB(255, 32, 136, 36), width: 5),
                    ),
                  ),
                  child: const Text(
                    "SIGN IN",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 30, top: 15),
              child: Text(
                "Forgot password ?",
                style: TextStyle(color: Color.fromARGB(255, 32, 136, 36)),
                textAlign: TextAlign.left,
              ),
            )
          ],
        ),
      ),
    );
  }
}
