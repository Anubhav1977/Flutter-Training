import 'package:flutter/material.dart';

class PlayScreenWidget extends StatelessWidget {
  const PlayScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                "https://dm0qx8t0i9gc9.cloudfront.net/watermarks/image/rDtN98Qoishumwih/seamless-texture-with-tic-tac-toe-vector_Xyx2l8_SB_PM.jpg"),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 60,
              right: 60,
              top: 610,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TicTacToeWidget()));
                },
                child: Text(
                  "𝑷𝒍𝒂𝒚 𝑵𝒐𝒘 !!",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20),
                  elevation: 30,
                  backgroundColor: Color(0xff03756a),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TicTacToeWidget extends StatefulWidget {
  const TicTacToeWidget({Key? key}) : super(key: key);

  @override
  State<TicTacToeWidget> createState() => _TicTacToeWidgetState();
}

class _TicTacToeWidgetState extends State<TicTacToeWidget> {
  List<List<String>> gameBoard = [];
  String? currentplayer;
  List<List<bool>> isTapped = [];
  bool? isSelected;
  late String winner;
  int xCtr = 0;
  int oCtr = 0;
  bool flag = false;

  initializeGame() {
    gameBoard = List.generate(3, (_) => List.filled(3, ""));
    isTapped = List.generate(3, (_) => List.filled(3, false));
    currentplayer = '𒉽';
  }

  ontap(int row, int col) {
    print("tapped on [${row},${col}]");
    if (gameBoard[row][col].isEmpty) {
      setState(
        () {
          flag = true;
          isTapped[row][col] = true;
          gameBoard[row][col] = currentplayer!;
          currentplayer = (currentplayer == '𒉽') ? '𒆸' : '𒉽';
          print(currentplayer);
        },
      );
    }
  }

  showWinnerDialog(String winner) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Game Over"),
        content:
            Text(winner == "Draw" ? "It's a Draw" : "The Winner is $winner !!"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                initializeGame();
                winner = '';
              });
            },
            child: Text("Play Again"),
          ),
        ],
      ),
    );
  }

  String? checkWinner() {
    bool isDraw = true;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (gameBoard[i][j].isEmpty) {
          isDraw = false;
          break;
        }
      }
    }
    for (int i = 0; i < 3; i++) {
      if (gameBoard[i][0] == gameBoard[i][1] &&
          gameBoard[i][0] == gameBoard[i][2] &&
          gameBoard[i][0].isNotEmpty) {
        return gameBoard[i][0];
      } else if (gameBoard[0][i] == gameBoard[1][i] &&
          gameBoard[0][i] == gameBoard[2][i] &&
          gameBoard[0][i].isNotEmpty) {
        return gameBoard[0][i];
      }
    }
    if (gameBoard[0][0] == gameBoard[1][1] &&
        gameBoard[0][0] == gameBoard[2][2] &&
        gameBoard[0][0].isNotEmpty) {
      return gameBoard[0][0];
    } else if (gameBoard[2][0] == gameBoard[1][1] &&
        gameBoard[2][0] == gameBoard[0][2] &&
        gameBoard[2][0].isNotEmpty) {
      return gameBoard[2][0];
    } else if (isDraw) {
      return "Draw";
    } else {
      return null;
    }
  }

  void initState() {
    super.initState();
    initializeGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("TIC TAC TOE",
              style: TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: Colors.black26,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios_new))),
      body: Container(
        // color: ,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "𒉽 Wins : $xCtr",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "𒆸 Wins : $oCtr",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Text("Current Player : $currentplayer",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 100,
            ),
            Container(
              height: 300,
              width: 300,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: 9,
                itemBuilder: (context, index) {
                  final row = (index ~/ 3);
                  final col = (index % 3);
                  return GestureDetector(
                    onTap: () {
                      ontap(row, col);
                      winner = checkWinner()!;
                      if (winner == '𒉽') {
                        xCtr++;
                      } else if (winner == '𒆸') {
                        oCtr++;
                      }
                      if (winner.isNotEmpty) {
                        showWinnerDialog(winner);
                        print("𒉽 : $xCtr and O : $oCtr");
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              isTapped[row][col] ? Colors.green : Colors.grey),
                      child: Center(
                        child: Text(
                          gameBoard[row][col],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
