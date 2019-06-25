import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Contador de pessoas",
    home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int people = 0;
  String info = "pode entrar!";

  void changePeople(int delta) {
    setState(() {
      people += delta;

      if (people < 0) {
        return info = "ta locão!?";
      } else if (people <= 10) {
        return info = "Pode entrar!!";
      } else {
        return info = "Lotado";
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: < Widget > [
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: < Widget > [
            Text("Pessoas: $people",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: < Widget > [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                    child: Text("+1",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    onPressed: () {
                     changePeople(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                    child: Text("-1",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    onPressed: () {
                      changePeople(-1);
                    },
                  ),
                ),
              ],
            ),
            Text("$info",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
                fontSize: 30.0)
            ),
          ],
        )
      ],
    );
  }
}