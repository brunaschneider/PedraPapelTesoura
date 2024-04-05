import 'dart:math';
import 'package:flutter/material.dart';

class PPTGame {
  String _imgUserPlayer = "imagens/indefinido.png";
  String _imgAppPlayer = "imagens/indefinido.png";

  int _userPoints = 0;
  int _appPoints = 0;
  int _tiePoints = 0;

  Color _borderUserColor = Colors.transparent;
  Color _borderAppColor = Colors.transparent;

  void play(String userChoice) {
    _imgUserPlayer = "imagens/$userChoice.png";

    String appChoice = _getAppChoice();
    _imgAppPlayer = "imagens/$appChoice.png";

    _calculateResult(userChoice, appChoice);
  }

  String _getAppChoice() {
    var options = ['pedra', 'papel', 'tesoura'];
    return options[Random().nextInt(3)];
  }

  void _calculateResult(String userChoice, String appChoice) {
    String result;

    if (userChoice == appChoice) {
      result = 'empate';
    } else if ((userChoice == 'pedra' && appChoice == 'tesoura') ||
        (userChoice == 'papel' && appChoice == 'pedra') ||
        (userChoice == 'tesoura' && appChoice == 'papel')) {
      result = 'user';
    } else {
      result = 'app';
    }

    _updateScore(result);
  }

  void _updateScore(String result) {
    if (result == 'user') {
      _userPoints++;
      _borderUserColor = Colors.green;
      _borderAppColor = Colors.transparent;
    } else if (result == 'app') {
      _appPoints++;
      _borderUserColor = Colors.transparent;
      _borderAppColor = Colors.green;
    } else {
      _tiePoints++;
      _borderUserColor = Colors.orange;
      _borderAppColor = Colors.orange;
    }
  }

  String getUserImage() {
    return _imgUserPlayer;
  }

  String getAppImage() {
    return _imgAppPlayer;
  }

  int getUserPoints() {
    return _userPoints;
  }

  int getAppPoints() {
    return _appPoints;
  }

  int getTiePoints() {
    return _tiePoints;
  }

  Color getUserBorderColor() {
    return _borderUserColor;
  }

  Color getAppBorderColor() {
    return _borderAppColor;
  }
}

class PPTScreen extends StatefulWidget {
  const PPTScreen({Key? key}) : super(key: key);

  @override
  _PPTScreenState createState() => _PPTScreenState();
}

class _PPTScreenState extends State<PPTScreen> {
  PPTGame _game = PPTGame();

  void _handlePlay(String choice) {
    setState(() {
      _game.play(choice);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App - Pedra Papel Tesoura"),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 20),
            child: Text(
              'Disputa',
              style: TextStyle(fontSize: 26),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Badge(
                  borderColor: _game.getUserBorderColor(),
                  imgPlayer: _game.getUserImage()),
              const Text('VS'),
              Badge(
                  borderColor: _game.getAppBorderColor(),
                  imgPlayer: _game.getAppImage()),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 20),
            child: Text(
              'Placar',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Placar(playerName: 'Você', playerPoints: _game.getUserPoints()),
              Placar(playerName: 'Empate', playerPoints: _game.getTiePoints()),
              Placar(playerName: 'App', playerPoints: _game.getAppPoints()),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 20),
            child: Text(
              'Opções',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _handlePlay("pedra"),
                child: Image.asset(
                  'imagens/pedra.png',
                  height: 90,
                ),
              ),
              GestureDetector(
                onTap: () => _handlePlay("papel"),
                child: Image.asset(
                  'imagens/papel.png',
                  height: 90,
                ),
              ),
              GestureDetector(
                onTap: () => _handlePlay("tesoura"),
                child: Image.asset(
                  'imagens/tesoura.png',
                  height: 90,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Placar extends StatelessWidget {
  const Placar({
    Key? key,
    required this.playerName,
    required this.playerPoints,
  }) : super(key: key);

  final String playerName;
  final int playerPoints;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(playerName),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black45, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(7)),
          ),
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(35),
          child: Text(playerPoints.toString(),
              style: const TextStyle(fontSize: 26)),
        ),
      ],
    );
  }
}

class Badge extends StatelessWidget {
  const Badge({
    Key? key,
    required this.borderColor,
    required this.imgPlayer,
  }) : super(key: key);

  final Color borderColor;
  final String imgPlayer;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 4),
        borderRadius: const BorderRadius.all(Radius.circular(100)),
      ),
      child: Image.asset(
        imgPlayer,
        height: 120,
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: PPTScreen(),
  ));
}
