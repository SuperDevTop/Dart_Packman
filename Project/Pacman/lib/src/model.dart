part of dartpacman;

class Pacman {
  final PacmanGame _game;

  // List of body elements of this pacman.
  List<Map<String, int>> _body = [];
  Map get tail => _body.last;

  int _dr;
  int _dc;

  Pacman.on(this._game) {
    final s = _game.size;

    _body = [
      { 'row' : s - 2,     'col' : s ~/ 2 },   
    ];

    headUp();
  }

  void move() {
    final newrow = head['row'] + _dr;
    final newcol = head['col'] + _dc;
    
    // Check if corn & block is present on next field
    final corn = _game.corn.where((m) => m.row == newrow && m.col == newcol);
    final block = _game.block.where((m) => m.row == newrow && m.col == newcol);
    final ghost1 = _game.ghost1.where((m) => m.row == newrow && m.col == newcol);
    final ghost2 = _game.ghost2.where((m) => m.row == newrow && m.col == newcol);
    final ghost3 = _game.ghost3.where((m) => m.row == newrow && m.col == newcol);
    final ghost4 = _game.ghost4.where((m) => m.row == newrow && m.col == newcol);

    if (ghost1.isEmpty){ }      
    else {
      ghostDirection = 0;
    }

    if (ghost2.isEmpty){ }
    else {
      ghostDirection = 0;
    }

    if (ghost3.isEmpty){ }      
    else {
      ghostDirection = 0;
    }

    if (ghost4.isEmpty){ }      
    else {
      ghostDirection = 0;
    }
    
    if (corn.isEmpty){      
    }      
    else {
      _game.corn.removeWhere((corn) => corn.row == newrow && corn.col == newcol);
      
      if(block.isEmpty){
        scores++; 
      }           
    }

    if(block.isEmpty){
      _body.insert(0, { 'row' : newrow, 'col' : newcol });
      _body.remove(tail);
    }
    else {
      _body.insert(0, { 'row' : newrow - _dr, 'col' : newcol - _dc });
      _body.remove(tail);            
    }
  }

  void headUp()    { _dr = -1; _dc =  0; }
  void headDown()  { _dr =  1; _dc =  0; }
  void headLeft()  { _dr =  0; _dc = -1; }
  void headRight() { _dr =  0; _dc =  1; }

  bool get onField {
    return head['row'] >= 0 &&
           head['row'] < _game.size &&
           head['col'] >= 0 &&
           head['col'] < _game.size &&
           ghostDirection != 0;        
  }

  bool get notOnField => !onField;
  Map get head => _body.first;

  List<Map<String, int>> get body => _body;
}

class Corn {
  final PacmanGame _game;

  int _row;
  int _col;
  int _dr;
  int _dc;

  Corn.staticOn(this._game, this._row, this._col) {
    _dr = 0;
    _dc = 0;
  }

  Corn.addOn(this._game, this._row, this._col) {
    _dr = 1;
    _dc = 1;
  }

  int get row => _row;
  int get col => _col;

  Map<String, int> get pos => { 'row' : _row, 'col' : _col };
}

class Block {
  final PacmanGame _game;

  int _row;
  int _col;
  int _dr;
  int _dc;

  Block.staticOn(this._game, this._row, this._col) {
    _dr = 0;
    _dc = 0;
  }

  Block.addOn(this._game, this._row, this._col) {
    _dr = 1;
    _dc = 1;
  }

  int get row => _row;
  int get col => _col;

  Map<String, int> get pos => { 'row' : _row, 'col' : _col };
}

class Ghost1 {
  final PacmanGame _game;

  int _row;
  int _col;
  int _dr;
  int _dc;

  Ghost1.staticOn(this._game, this._row, this._col) {
    _dr = 0;
    _dc = 0;
  }

  Ghost1.movingOn(this._game, this._row, this._col) {
    _dc = 1;    
  }

  int get row => _row;
  int get col => _col;

  Map<String, int> get pos => { 'row' : _row, 'col' : _col };

  void move() {
    if(this._col == 1){
      _dc = 1;
    }
    else if(this._col == 13){
      _dc = -1;
    }

    _col += _dc; 
  }
}

class Ghost2 {
  final PacmanGame _game;

  int _row;
  int _col;
  int _dr;
  int _dc;

  Ghost2.staticOn(this._game, this._row, this._col) {
    _dr = 0;
    _dc = 0;
  }

  Ghost2.movingOn(this._game, this._row, this._col) {
    _dc = 1;    
  }

  int get row => _row;
  int get col => _col;

  Map<String, int> get pos => { 'row' : _row, 'col' : _col };

  void move() {
    if(this._row == 4){
      _dr = 1;
    }
    else if(this._row == 9){
      _dr = -1;
    }

    _row += _dr; 
  }
}

class Ghost3 {
  final PacmanGame _game;

  int _row;
  int _col;
  int _dr;
  int _dc;

  Ghost3.staticOn(this._game, this._row, this._col) {
    _dr = 0;
    _dc = 0;
  }

  Ghost3.movingOn(this._game, this._row, this._col) {
    _dc = 1;    
  }

  int get row => _row;
  int get col => _col;

  Map<String, int> get pos => { 'row' : _row, 'col' : _col };

  void move() {
    if(this._col == 1){
      _dc = 1;
    }
    else if(this._col == 4){
      _dc = -1;
    }

    _col += _dc; 
  }
}

class Ghost4 {
  final PacmanGame _game;

  int _row;
  int _col;
  int _dr;
  int _dc;

  Ghost4.staticOn(this._game, this._row, this._col) {
    _dr = 0;
    _dc = 0;
  }

  Ghost4.movingOn(this._game, this._row, this._col) {
    _dc = 1;    
  }

  int get row => _row;
  int get col => _col;

  Map<String, int> get pos => { 'row' : _row, 'col' : _col };

  void move() {
    if(this._row == 8){
      _dr = 1;
    }
    else if(this._row == 13){
      _dr = -1;
    }

    _row += _dr; 
  }
}

class PacmanGame {
  Pacman _pacman;
  List<Corn> _corn = [];
  List<Block> _block = [];
  List<Ghost1> _ghost1 = [];
  List<Ghost2> _ghost2 = [];
  List<Ghost3> _ghost3 = [];
  List<Ghost4> _ghost4 = [];

  // The field size of the game (nxn field)
  final int _size;

  // The gamestate of the game (one of #running, #stopped).
  Symbol _gamestate;

  bool get stopped => _gamestate == #stopped;
  bool get running => _gamestate == #running;

  void start() { _gamestate = #running; scores = 0; ghostDirection = 1; }
  void stop() { _gamestate = #stopped; }

  PacmanGame(this._size) {
    start();
    _pacman = new Pacman.on(this);
    addGhost1();
    addGhost2();
    addGhost3();
    addGhost4();

    for(int i = 0; i < 15; i++){
      for(int j = 0; j < 15; j++){
        if(i == 7 && j == 13){
          continue;
        }
        
        addCorn(i, j);
      }
    }

    // Add Blocks on the Field.
    for(int i = 0; i < 15; i++){
      addBlock(0, i);
      addBlock(14, i);
    }

    for(int i = 1; i < 14; i++){
      addBlock(i, 14);
      addBlock(i, 0);
    }

    for(int i = 0; i < 3; i++){
      addBlock(2, i + 2);
      addBlock(2, i + 9);            
      addBlock(i + 2, 6);
      addBlock(i + 2, 7);
      addBlock(i + 4, 2);
      addBlock(i + 4, 3);
      addBlock(i + 4, 10);
      addBlock(i + 10, 2);   
      addBlock(i + 10, 4);                          
    }

    for(int i = 0; i < 4; i++){
      addBlock(5, i + 5);
      addBlock(8, i + 2);
      addBlock(10, i + 9);
      addBlock(12, i + 9);
      
    }

    for(int i = 0; i < 5; i++){
      addBlock(8, 8 + i);
      addBlock(i + 2, 12);
      addBlock(i + 8, 6);
      addBlock(i + 8, 7);      
    }
    
    stop();
  }

  bool get gameOver => pacman.notOnField;
  Pacman get pacman => _pacman;
  List<Corn> get corn => _corn;
  List<Block> get block => _block;
  List<Ghost1> get ghost1 => _ghost1;
  List<Ghost2> get ghost2 => _ghost2;
  List<Ghost3> get ghost3 => _ghost3;
  List<Ghost4> get ghost4 => _ghost4;

  List<List<Symbol>> get field {
    List<List<Symbol>> _field = new Iterable.generate(_size, (row) {
      return new Iterable.generate(_size, (col) => #empty).toList();
    }).toList();

    for (Corn m in corn) {
      if (m.row < size && m.col < size)
        _field[m.row][m.col] = #corn;
      else
        print (m);
    };

    for (Block m in block) {
      if (m.row < size && m.col < size)
        _field[m.row][m.col] = #block;
      else
        print (m);
    };

    for (Ghost1 m in ghost1) {
      if (m.row < size && m.col < size)
        _field[m.row][m.col] = #ghost1;
      else
        print (m);
    };

    for (Ghost2 m in ghost2) {
      if (m.row < size && m.col < size)
        _field[m.row][m.col] = #ghost2;
      else
        print (m);
    };

    for (Ghost3 m in ghost3) {
      if (m.row < size && m.col < size)
        _field[m.row][m.col] = #ghost3;
      else
        print (m);
    };

    for (Ghost4 m in ghost4) {
      if (m.row < size && m.col < size)
        _field[m.row][m.col] = #ghost4;
      else
        print (m);
    };

    pacman.body.forEach((s) {
      final r = s['row'];
      final c = s['col'];

      if (r < 0 || r >= _size) return;
      if (c < 0 || c >= _size) return;

      if(direction == 0) {
        _field[r][c] = #pacman_up;
      }
      else if(direction == 1) {
        _field[r][c] = #pacman_left;
      }
      else if(direction == 2){
        _field[r][c] = #pacman_right;
      }
      else {
        _field[r][c] = #pacman_down;
      }      
    });

    return _field;
  }

  void movepacman() { 
    if (running) {
      pacman.move();          
    }
  }

  void moveGhost1() { if (running) ghost1.forEach((m) => m.move()); }
  void moveGhost2() { if (running) ghost2.forEach((m) => m.move()); }
  void moveGhost3() { if (running) ghost3.forEach((m) => m.move()); }
  void moveGhost4() { if (running) ghost4.forEach((m) => m.move()); }

  void addGhost1() {
    if (stopped) return;
    _ghost1.add(new Ghost1.movingOn(this, 1, 1));
  }

  void addGhost2() {
    if (stopped) return;
    _ghost2.add(new Ghost2.movingOn(this, 4, 6));
  }

  void addGhost3() {
    if (stopped) return;
    _ghost3.add(new Ghost3.movingOn(this, 5, 1));
  }

  void addGhost4() {
    if (stopped) return;
    _ghost4.add(new Ghost4.movingOn(this, 13, 11));
  }

  void addCorn(int posx, int posy) {
    if (stopped) return;
    _corn.add(new Corn.addOn(this, posy, posx));
  }

  void addBlock(int posx, int posy) {
    if (stopped) return;
    _block.add(new Block.addOn(this, posy, posx));
  }

  // Returns the size of the game. The game is played on a nxn-field.
  int get size => _size;
  String toString() => field.map((row) => row.join(" ")).join("\n");
}