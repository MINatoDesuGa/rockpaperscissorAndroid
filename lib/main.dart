import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Game(),
      ),
    );
  }
}

var computer_weapon = ["Rock", "Paper", "Scissor"];
String playerIn = "", computerIn = "", result = "";

int check_winner(int player) {
  int computer = Random().nextInt(3);
  playerIn = computer_weapon[player];
  computerIn = computer_weapon[computer];

  if(player != computer) {
    if(player == 0 && computer == 2) return 1;
    else if(player == 1 && computer == 0) return 1;
    else if(player == 2 && computer == 1) return 1;
    else return 0;
  } else {
    return 2;
  }
}

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  int score = 0;
  int player_choice;

  CustomDialog(BuildContext context) {
    return showDialog(context: context, barrierDismissible: false ,builder: (context) {
      return AlertDialog(
        title: Text('Your Score'),
        content: Text('$score'),
        actions: <Widget>[
          Row(
            children: <Widget>[
          MaterialButton(
            elevation: 5.0,
            child: Text('Play Again'),
            onPressed: () {
              setState(() {
                score = 0;
                playerIn = "";
                computerIn = "";
                result = "";
              });
              Navigator.of(context).pop();
            },
          ),

          MaterialButton(onPressed: () {
              exit(0);
            },
            elevation: 5.0,
            child: Text('Exit'),
          )
          ],
          )
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top;
    final w = MediaQuery.of(context).size.width;

    return Column(
      children: <Widget>[
        SizedBox(
          height: h * 0.05,
        ),
        Container(
          child: Center(
            child: Text('Score: $score',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.orangeAccent,
                fontSize: 30.0
              ),
            ),
          ),
        ),

        Container(
          height: h * 0.1,
          child: Center(
            child: Text("Choose your weapon",
              style: TextStyle(
                fontFamily: 'Ranchers',
                color: Colors.blue[900],
                fontSize: 40.0
              ),
            ),
          ),
        ),

        SizedBox(
          height: h * 0.05,
        ),

        FlatButton(
          color: Colors.blueGrey,
          onPressed: () {
            player_choice = 0;
            int temp = check_winner(player_choice);

            setState(() {
              if(temp == 1) {
                result = "WIN!";
                score++;
              } else if(temp != 2) {
                result = "LOSE!";
                CustomDialog(context);
              } else {
                result = "DRAW!";
              }
            });
          },
          child: Text('ROCK',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40.0
            ),
          ),
        ),

        SizedBox(
          height: h * 0.05,
        ),

        FlatButton(
          color: Colors.blueGrey,
          onPressed: () {
            player_choice = 1;
            int temp = check_winner(player_choice);

            setState(() {
              if(temp == 1) {
                result = "WIN!";
                score++;
              } else if(temp != 2) {
                result = "LOSE!";
                CustomDialog(context);
              } else {
                result = "DRAW!";
              }
            });
          },
          child: Text('PAPER',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0
            ),
          ),
        ),

        SizedBox(
          height: h * 0.05,
        ),

        FlatButton(
          color: Colors.blueGrey,
          onPressed: () {
            player_choice = 2;
            int temp = check_winner(player_choice);

            setState(() {
              if(temp == 1) {
                result = "WIN!";
                score++;
              } else if(temp != 2) {
                result = "LOSE!";
                CustomDialog(context);
              } else {
                result = "DRAW!";
              }
            });
          },
          child: Text('SCISSOR',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0
            ),
          ),
        ),

        SizedBox(
          height: h * 0.05,
          child: Divider(
            color: Colors.black,
            thickness: 2.0,
          ),
        ),

        Row(
          children: <Widget>[
            Container(
              width: w * 0.5,
              child: Column(
                children: <Widget>[
                  Center(
                    child: Text('YOU',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0
                      ),
                    ),
                  ),
                  Center(
                    child: Text('$playerIn',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 25.0
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: w * 0.5,
              child: Column(
                children: <Widget>[
                  Center(
                    child: Text('COMPUTER',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0
                      ),
                    ),
                  ),
                  Center(
                    child: Text('$computerIn',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 25.0
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),

        SizedBox(
          height: h * 0.05,
          child: Divider(
            color: Colors.black,
            thickness: 2.0,
          ),
        ),

        Container(
          height: h * 0.08,
          child: Center(
            child: Text('$result',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
                fontFamily: 'Staatliches'
              ),
            ),
          ),
        ),

        SizedBox(
          height: h * 0.1,
        ),

        Container(
          height: h * 0.05,
          child: FloatingActionButton(onPressed: () {exit(0);},
            backgroundColor: Colors.red,
            child: Image.asset('stuffs/Exit.png'),
          )
        )
      ],
    );
  }
}

