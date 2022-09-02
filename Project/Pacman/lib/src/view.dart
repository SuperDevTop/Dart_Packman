part of dartpacman;

class PacmanView {
  final overlay = querySelector("#overlay");
  final title = querySelector("#title");
  final welcome = querySelector("#welcome");
  final highscore = querySelector("#highscore");
  final game = querySelector('#PacmanGame');
  final background = querySelector('#background');
  final gameover = querySelector('#gameover');
  final reasons = querySelector('#reasons');
  final points = querySelector('#points');

  HtmlElement get startButton => querySelector('#start');

  //Contains all TD Elements of the field.
  List<List<HtmlElement>> fields;

  void update(PacmanGame model) {
    welcome.style.display = model.stopped ? "block" : "none";
    points.innerHtml = "Points: ${scores}";
    gameover.innerHtml = model.gameOver ? "Game Over" : "";
    reasons.innerHtml = "";

    if (model.gameOver) {
      final onfield = model.pacman.notOnField ? "Try again!<br>" : "";
      reasons.innerHtml = "$onfield";
    }

    // Updates the field
    final field = model.field;

    for (int row = 0; row < field.length; row++) {
      for (int col = 0; col < field[row].length; col++) {
        final td = fields[row][col];

        if (td != null) {
          td.classes.clear();
          if (field[row][col] == #corn) td.classes.add('corn');
          if (field[row][col] == #block) td.classes.add('block');
          if (field[row][col] == #ghost1) td.classes.add('ghost1');
          if (field[row][col] == #ghost2) td.classes.add('ghost2');
          if (field[row][col] == #ghost3) td.classes.add('ghost3');
          if (field[row][col] == #ghost4) td.classes.add('ghost4');
          if (field[row][col] == #pacman_up) td.classes.add('pacman_up');
          if (field[row][col] == #pacman_down) td.classes.add('pacman_down');
          if (field[row][col] == #pacman_left) td.classes.add('pacman_left');
          if (field[row][col] == #pacman_right) td.classes.add('pacman_right');
          else if (field[row][col] == #empty) td.classes.add('empty');
        }
      }
    }
  }

  void generateField(PacmanGame model) {
    final field = model.field;
    String table = "";

    for (int row = 0; row < field.length; row++) {
      table += "<tr>";

      for (int col = 0; col < field[row].length; col++) {
        final assignment = field[row][col];
        final pos = "field_${row}_${col}";
        table += "<td id='$pos' class='$assignment'></td>";
      }
      
      table += "</tr>";
    }

    game.innerHtml = table;
    fields = new List<List<HtmlElement>>(field.length);

    for (int row = 0; row < field.length; row++) {
      fields[row] = [];

      for (int col = 0; col < field[row].length; col++) {
        fields[row].add(game.querySelector("#field_${row}_${col}"));
      }
    }
  }

  closeForm() => overlay.innerHtml = "";

  String get user => (document.querySelector('#user') as InputElement).value;
  String get password => (document.querySelector('#pwd') as InputElement).value;
}