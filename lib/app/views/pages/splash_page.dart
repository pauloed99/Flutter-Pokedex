import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    Future.delayed(
        Duration(seconds: 3), () => Modular.to.pushReplacementNamed('pokemon'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constraints) {
          final maxWidth = constraints.maxWidth;
          final maxHeight = constraints.maxHeight;
          return Stack(
            children: [
              Image.asset(
                'assets/images/pokedexSplashScreen.jpg',
                height: maxHeight,
                width: maxWidth,
                fit: BoxFit.cover,
              ),
              Container(
                alignment: Alignment.center,
                height: maxHeight,
                width: maxWidth,
                padding: EdgeInsets.only(top: maxHeight * .4),
                child: Text(
                  'Pokedéx',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: MediaQuery.of(context).size.height * .08,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
