 import 'package:flutter_dotenv/flutter_dotenv.dart';

class  Enviroment{
  static String theMoviedbKey = dotenv.env['THE_MOVIEDB_KEY'] ?? 'No se encontro la variable de entorno';
}