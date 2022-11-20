import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:graduation/homescreen.dart';

class idSignIn extends StatefulWidget {
  const idSignIn({super.key});

  @override
  State<idSignIn> createState() => _idSignInState();
}

class _idSignInState extends State<idSignIn> {
  TextEditingController idController = TextEditingController();
  TextEditingController passController = TextEditingController();

  double screenHeight = 0;
  double screenWidth = 0;
  Color primary = const Color(0XFFEEF444C);

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;

    screenWidth = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            height: screenHeight / 2.5,
            width: screenWidth,
            decoration: BoxDecoration(
                color: primary,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(70),
                )),
            child: Center(
                child: Icon(
              Icons.person,
              color: Colors.white,
              size: screenWidth / 5,
            )),
          ),
          Container(
            margin: EdgeInsets.only(
              top: screenHeight / 15,
              bottom: screenHeight / 20,
            ),
            child: Text(
              "Login",
              style: TextStyle(
                fontSize: screenWidth / 25,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(
              horizontal: screenWidth / 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                fieldTitle("Employee ID"),
                customField("Enter your employee id", idController, false),
                fieldTitle("Password"),
                customField("Enter your password", passController, true),
                GestureDetector(
                  onTap: () async {
                    String id = idController.text.trim();
                    String password = passController.text.trim();

                    if (id.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Employee id is still empty"),
                      ));
                    } else if (password.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Password is still empty"),
                      ));
                    } else {
                      QuerySnapshot snap = await FirebaseFirestore.instance
                          .collection("Parent")
                          .where('id', isEqualTo: id)
                          .get();
                      try {
                        if (password == snap.docs[0]['password']) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Password is not correct"),
                          ));
                        }
                      } catch (e) {
                        String error = " ";
                        if (e.toString() ==
                            "RangeError (index): Invalid value: Valid value range is empty: 0") {
                          setState(() {
                            error = "Employee id does not exist";
                          });
                        } else {
                          setState(() {
                            error = "Error occurred!";
                          });
                        }
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(error),
                        ));
                      }
                    }
                  },
                  child: Container(
                    height: 60,
                    width: screenWidth,
                    margin: EdgeInsets.only(top: screenHeight / 40),
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Center(
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                          fontSize: screenWidth / 26,
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget fieldTitle(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Text(title,
          style: TextStyle(
            fontSize: screenWidth / 30,
          )),
    );
  }

  Widget customField(
      String hint, TextEditingController controller, bool obscure) {
    return Container(
      width: screenWidth,
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
                color: Colors.black26, blurRadius: 10, offset: Offset(2, 2))
          ]),
      child: Row(
        children: [
          Container(
            width: screenWidth / 6,
            child: Icon(
              Icons.person,
              color: primary,
              size: screenWidth / 15,
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(right: screenWidth / 12),
            child: TextFormField(
              controller: controller,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: screenHeight / 35,
                ),
                border: InputBorder.none,
                hintText: hint,
              ),
              maxLines: 1,
              obscureText: obscure,
            ),
          ))
        ],
      ),
    );
  }
}
