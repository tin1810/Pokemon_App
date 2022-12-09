import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/app/util/color.dart';
import 'package:pokemon_app/app/view/home/bloc/home_bloc.dart';
import 'package:pokemon_app/app/view/home/screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(const GetHomeEvent());

    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/pokeball.png",
              fit: BoxFit.cover,
              height: 150,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
              child: Text(
            "Pokemon App",
            style: TextStyle(fontSize: 20),
          ))
        ],
      ),
    );
  }
}
