class Peliculas {
  List<Pelicula> items = new List();

  Peliculas();

  Peliculas.fromJsonList(List<dynamic> data) {
    if(data.isEmpty) {
      return;
    }

    for(final item in data) {
      final peliculaAux = new Pelicula.fromJsonMap(item);
      items.add(peliculaAux);
    }
  }
}

class Pelicula {
  String uid;
  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  String releaseDate;

  Pelicula({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  Pelicula.fromJsonMap(Map<String, dynamic> json) {
    this.popularity = json['popularity'] / 1;
    this.voteCount  = json['vote_count'];
    this.video = json['video'];
    this.posterPath = json['poster_path'];
    this.id = json['id'];
    this.adult = json['adult'];
    this.backdropPath = json['backdrop_path'];
    this.originalLanguage = json['original_language'];
    this.originalTitle = json['original_title'];
    this.genreIds = json['genre_ids'].cast<int>();
    this.title = json['title'];
    this.voteAverage = json['vote_average'] / 1;
    this.overview  = json['overview'];
    this.releaseDate  = json['release_date'];
  }

   getPosterImg() {
     if(posterPath == null)
     {
       return 'https://thumbs.dreamstime.com/b/no-image-available-icon-vector-illustration-flat-design-140476186.jpg';
     }
     return 'https://image.tmdb.org/t/p/w500/$posterPath';
   }

    getBackgroundImg() {
     if(posterPath == null)
     {
       return 'https://thumbs.dreamstime.com/b/no-image-available-icon-vector-illustration-flat-design-140476186.jpg';
     }
     return 'https://image.tmdb.org/t/p/w500/$backdropPath';
   }
}
