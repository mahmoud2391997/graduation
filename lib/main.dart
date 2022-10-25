import 'package:flutter/material.dart';
import 'UI.dart';
import 'signIn.dart';
import 'welcome.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        
        
        
        
        
        
        
        
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color.fromARGB(255, 243, 233, 218),
      ),
      home: const onBoardingScreen(),
      routes: {
        '/UI/':(context) => const UI(),
      },
    );
  }
}

class onBoardingScreen extends StatefulWidget {
  const onBoardingScreen({super.key});

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children:[ PageView(
          children: [
            MyHomePage(),
            LoginPage(),
          ],
        ),
        Container(
          alignment: Alignment(0,0.75),
          child: SmoothPageIndicator(controller:_controller,count:2)),
      ],
      ),
      
    );
  }
}