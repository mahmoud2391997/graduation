import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  

  
  
  

  
  
  
  

  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 late double height, width;
 

  

  @override
  Widget build(BuildContext context) {
    height =MediaQuery.of(context).size.height;
    
    width =MediaQuery.of(context).size.width;
    
    
    
    return Scaffold(
      body: Stack(
        children: [
          Column(
            
            children: [
              Container(
                height: height* .7,
                      width: height* .7,          

                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 189, 115, 19),
                  image: DecorationImage(
                              image: AssetImage("assets/mySchool.jpg"),
                          ),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(100),
                            bottomLeft: Radius.circular(100),
                          ) 
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  
                
                           
                ),

                child: Container(
                  height: height* .3,
                  decoration: BoxDecoration(
                    // color: Color.fromARGB(255, 202, 183, 149),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(100),)
                  ),
                  child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "Welcome to",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,

                        ),
                      ),Text("DR. Khairy School",
                      style: TextStyle(
                          fontSize: 20,
                          color:Color.fromARGB(255, 3, 3, 3)),)
                    ],
                  ) ,
                ]
                ),
              )
              )
            ],
          ),
        
        ],
      ),
    );
  }
}
