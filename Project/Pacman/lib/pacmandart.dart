library dartpacman;

import 'dart:html';
import 'dart:async';
import 'dart:math';
import 'dart:convert';
import 'package:http/http.dart' as http;

part 'src/model.dart';
part 'src/control.dart';
part 'src/view.dart';

const gamesize = 15;
var scores = 0;
var direction = 0;
var ghostDirection = 1;