import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:peliculas/src/models/actores_models.dart';
import 'dart:convert';
import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculaProvider {

  String _apiKey = '8c9d919942eaccfc2148166f01053515';
  String _url = 'api.themoviedb.org';
  String _languaje = 'es-ES';
  int _popularesPage = 0;
  List<Pelicula> _populares = new List();
  bool _cargando = false;

  final _popularesStream = new StreamController<List<Pelicula>>.broadcast();

  Function(List<Pelicula>) get popularesSink => _popularesStream.sink.add;

  Stream<List<Pelicula>> get popularesStream => _popularesStream.stream;

  void dispose() {
    _popularesStream?.close();
  }

  Future<List<Pelicula>> getEnCines() async {
    final uri = Uri.https(_url,'3/movie/now_playing', {
      'api_key' : _apiKey,
      'langauje' : _languaje
    });

    final response  =  await http.get(uri);
    final decodedDate = json.decode(response.body);
    final result = Peliculas.fromJsonList(decodedDate['results']);
    return result.items;
  }

  Future<List<Pelicula>> getPopular() async {
    if(_cargando ) return [];
    else _cargando = true;
    _popularesPage++;
    final uri = Uri.https(_url, '/3/movie/popular', {
      'api_key' : _apiKey,
      'langauje' : _languaje,
      'page' : _popularesPage.toString()
    });

    final response  =  await http.get(uri);
    final decodedDate = json.decode(response.body);
    final result = Peliculas.fromJsonList(decodedDate['results']);
    final respuesta = result.items;
    _populares.addAll(respuesta);
    popularesSink(_populares);
    _cargando = false;
    return respuesta;

  }

  Future<List<Actor>> getCast(int peliculaId) async {
    final uri = Uri.https(_url,'3/movie/$peliculaId/credits', {
      'api_key' : _apiKey,
      'langauje' : _languaje
    });
    final response  =  await http.get(uri);
    final decodedDate = json.decode(response.body);
    final result = Actores.fromJsonList(decodedDate['cast']);
    return result.items;
  }

  Future<List<Pelicula>> buscarPelicula(String query) async {
    final uri = Uri.https(_url,'3/search/movie', {
      'api_key' : _apiKey,
      'langauje' : _languaje,
      'query' : query
    });

    final response  =  await http.get(uri);
    final decodedDate = json.decode(response.body);
    final result = Peliculas.fromJsonList(decodedDate['results']);
    return result.items;
  }


}