import 'package:flutter/material.dart';
import 'package:flutter_app/pages/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String changeName = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(Buildcontext) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome To $changeName",
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Material(
            color: Colors.white,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                      width: 300,
                      height: 200,
                      child: Image.asset("assets/images/login_img.png",
                          fit: BoxFit.cover)),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Welcome $changeName",
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.blue,
                      )),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter your UserName",
                            labelText: "UserName",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "This Field is Required";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            changeName = value;
                            setState(() {});
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            hintText: "Enter your Password",
                            contentPadding: EdgeInsets.all(0),
                            labelText: "Password",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "This Field is Required";
                            } else if (value.length < 8) {
                              return "Your Password Should be 8 character";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(changeButton ? 50 : 10),
                    color: Colors.deepPurple,
                    child: InkWell(
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 10),
                      splashColor: Colors.blue,
                      onTap: () => moveToHome(context),
                      //  async {
                      // setState(() {
                      //   changeButton = true;
                      // });
                      // await Future.delayed(Duration(seconds: 1));
                      // await Navigator.pushNamed(context, MyRoutes.homeRoute);
                      // setState(() {
                      //   changeButton = false;
                      // });
                      // },
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: changeButton ? 50 : 150,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(),
                        child: changeButton
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.yellow,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                      ),
                    ),
                  ),

                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //   },
                  //   child: Text("Login"),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
