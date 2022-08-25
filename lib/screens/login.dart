import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
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

class LoginWebView extends StatelessWidget {
  const LoginWebView(
      {Key? key, required this.maxHeight, required this.maxWidth})
      : super(key: key);
  final double maxWidth;
  final double maxHeight;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
          horizontal: maxWidth * 0.29, vertical: maxHeight * 0.1),
      child: Card(
        elevation: 7,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 60),
        child: Column(
          children: [
            Container(color: Colors.grey, height: 80, width: double.infinity),
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
              child: Padding(
                padding: const EdgeInsets.all(25),
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
                          color: Color.fromARGB(255, 32, 136, 36), width: 1),
                    ),
                  ),
                  child: const Text(
                    "SIGN UP",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LoginMobileView extends StatelessWidget {
  const LoginMobileView(
      {Key? key, required this.maxHeight, required this.maxWidth})
      : super(key: key);
  final double maxWidth;
  final double maxHeight;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(maxWidth * 0.05),
      child: Card(
        elevation: 7,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 60),
        child: Column(
          children: [
            Container(color: Colors.grey, height: 80, width: double.infinity),
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
            const Text(
              "Forgot password ?",
              style: TextStyle(color: Color.fromARGB(255, 32, 136, 36)),
              textAlign: TextAlign.left,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(25),
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
                    "SIGN UP",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
