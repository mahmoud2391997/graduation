import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:graduation/UI.dart';
class LoginPage extends StatefulWidget {
@override
  State<LoginPage> createState() => _LoginPageState();}
class _LoginPageState extends State<LoginPage> {
late final TextEditingController _email;
  late final TextEditingController _password;
  @override
  void initState(){
    _email=TextEditingController();
    _password=TextEditingController();
    super.initState();
  }
  @override
  void dispose(){
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
      Container(

      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/smart_schools.jpg'),
          fit: BoxFit.cover, )
      ),
    ),Scaffold(
     backgroundColor: Colors.transparent,
     body: SingleChildScrollView(
       child: SafeArea(
         child: Column(
           children: [
          Container(
            height: 150,
            child: Center(
              child: Text(' ',style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold,color: Colors.black,
              ),),
            ),
          ),SizedBox(
            height: 100,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
     child: Column(
       children: [Padding(
         padding: const EdgeInsets.symmetric(vertical: 12.0),
         child: Container(
     decoration: BoxDecoration(
         color: Colors.grey[600],
         borderRadius: BorderRadius.circular(16),
     ),
        child: TextField(
          controller: _email,
                          enableSuggestions: false,
                          autocorrect: false,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
            border: InputBorder.none,
            hintText: 'Email',
            
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(FontAwesomeIcons.solidEnvelope,color: Colors.white,size: 30,),
            )
     
          ),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
        ),
         ),
       )],
     ),
          ),
          
         Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
     child: Column(
       children: [Container(
     decoration: BoxDecoration(
       color: Colors.grey[600],
       borderRadius: BorderRadius.circular(16),
     ),
         child: TextField(
           controller: _password,
           enableSuggestions: false,
                          autocorrect: false,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 20),
          border: InputBorder.none,
          hintText: 'Password',
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(FontAwesomeIcons.lock,color: Colors.white,size: 30,),
          )
     
        ),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        obscureText: true,
         ),
       ),
       Column(children: [
        SizedBox(
          height: 100,
        ),
        Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(16),
          ),
          child: MaterialButton(onPressed: ()async{   
                        final email = _email.text;
                        final password = _password.text;
                        try{
                         
                          await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> UI()));
                        }       on FirebaseAuthException catch (e){
          if (e.code == 'user-not-found'){
            await showErrorDialog(context, 'User not found');
          } else if (e.code == 'worng-password'){
        await showErrorDialog(context,'Wrong credentials',);
                  } else {
                    await showErrorDialog(context, 'Error: ${e.code}',);
                  }
        } catch(e){
          await showErrorDialog(context, e.toString(),);
        }  }
, child: Padding(padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text('Login',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black ,)))),
        )
       ],)
       ],
     ),
          ), 
          ],
         ),
       ),
     ), 
    ),
      ] 
   );
  }
  Future<void> showErrorDialog(
  BuildContext context,
  String text,
){
  return showDialog(context: context, builder: (context){
    return AlertDialog(
      title: const Text ('An error occurred'),
      content: Text(text),
      actions: [
        TextButton(onPressed: () {
          Navigator.of(context).pop();
        },
         child: const Text('OK'),
         ),

      ],
    );
  });
}
}