part of dartpacman;

Duration ghostSpeed = Duration(milliseconds: 1000);

class PacmanGameController {
  var game = new PacmanGame(gamesize);
  final view = new PacmanView();

  Timer ghostTrigger1;
  Timer ghostTrigger2;
  Timer ghostTrigger3;
  Timer ghostTrigger4;

  PacmanGameController() {
    _loadParameter();
    view.generateField(game);

    // New game is started by user
    view.startButton.onClick.listen((_) {
      if (ghostTrigger1 != null) ghostTrigger1.cancel();
      if (ghostTrigger2 != null) ghostTrigger2.cancel();
      if (ghostTrigger3 != null) ghostTrigger3.cancel();
      if (ghostTrigger4 != null) ghostTrigger4.cancel();

      ghostTrigger1 = new Timer.periodic(ghostSpeed, (_) => _moveGhost1());   
      ghostTrigger2 = new Timer.periodic(ghostSpeed, (_) => _moveGhost2());   
      ghostTrigger3 = new Timer.periodic(ghostSpeed, (_) => _moveGhost3()); 
      ghostTrigger4 = new Timer.periodic(ghostSpeed, (_) => _moveGhost4()); 
      ghostDirection = 1;
      _newGame();
      game.start();
      view.update(game);
    });

    // Steering of the pacman
    window.onKeyDown.listen((KeyboardEvent ev) {
      if (game.stopped) return;
      switch (ev.keyCode) {
        case KeyCode.LEFT:  direction = 1; game.pacman.headLeft(); _movepacman(); if(scores >= 105) { _gameOver(); } break;
        case KeyCode.RIGHT: direction = 2; game.pacman.headRight(); _movepacman(); if(scores >= 105) { _gameOver(); } break;
        case KeyCode.UP:    direction = 0; game.pacman.headUp(); _movepacman(); if(scores >= 105) { _gameOver(); } break;
        case KeyCode.DOWN:  direction = 3; game.pacman.headDown(); _movepacman(); if(scores >= 105) { _gameOver(); } break;
      }
    });
  }  

  // Loads the game parameters.
  void _loadParameter() async {
    var response = await http.get(Uri.http(window.location.host, "/parameter.json"));
    var parameters = jsonDecode(response.body);
    ghostSpeed = Duration(milliseconds: parameters['ghostSpeed'] as int);
  }

  // Handles Game Over.
  void _gameOver() async {
    ghostTrigger1.cancel();
    ghostTrigger2.cancel();
    ghostTrigger3.cancel();
    ghostTrigger4.cancel();

    game.stop();
    view.update(game);
  }

  // Moves all ghost.
  void _moveGhost1() {
    if (game.gameOver) { _gameOver(); return; }
    
    game.moveGhost1();
    view.update(game);
  }

  void _moveGhost2() {
    if (game.gameOver) { _gameOver(); return; }
    
    game.moveGhost2();
    view.update(game);
  }

  void _moveGhost3() {
    if (game.gameOver) { _gameOver(); return; }
    
    game.moveGhost3();
    view.update(game);
  }

  void _moveGhost4() {
    if (game.gameOver) { _gameOver(); return; }
    
    game.moveGhost4();
    view.update(game);
  }

  // Initiates a new game.
  void _newGame() async {
    view.closeForm();
    game = new PacmanGame(gamesize);
    view.update(game);
  }

  // Moves the pacman.
  void _movepacman() {
    if (game.gameOver) { _gameOver(); return; }        

    game.movepacman();

    if (game.gameOver) return;
    
    view.update(game);
  }  
}