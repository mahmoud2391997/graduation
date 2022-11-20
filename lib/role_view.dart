import 'package:flutter/material.dart';
import 'package:graduation/CanteenWorker_id_signIn.dart';
import 'package:graduation/id_signin.dart';
import 'package:graduation/parent_id_signIn.dart';
import 'package:graduation/teacher_id_signIn.dart';
import 'signIn.dart';

class role extends StatelessWidget {
  const role({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color.fromARGB(255, 122, 103, 78),
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/HELLOO.jpg'),
        fit: BoxFit.cover,
      )),
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                "",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              )
            ],
          ),
          Container(
            height: 150,
            child: Center(
              child: Text(
                '',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(16),
            ),
            child: MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => ID()));
                },
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text('Parent',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )))),
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(16),
            ),
            child: MaterialButton(
              minWidth: double.infinity,
              height: 60,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Teacher_ID()));
              },
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text('Teacher',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ))),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(16),
            ),
            child: MaterialButton(
              minWidth: double.infinity,
              height: 60,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CanteenWorkerID()));
              },
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text('Canteen worker',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ))),
            ),
          )
        ],
      ),
    ));
  }
}
