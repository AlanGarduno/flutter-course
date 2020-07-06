class Actores {

  List<Actor> items = new List();

  Actores();

  Actores.fromJsonList(List<dynamic> data) {
    if(data.isEmpty) {
      return;
    }

    for(final item in data) {
      final actor = new Actor.fromJsonMap(item);
      items.add(actor);
    }
  }



}

class Actor {
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Actor({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  Actor.fromJsonMap(Map<String, dynamic> json) {
    this.castId =  json['cast_id'];
    this.character =  json['character'];
    this.creditId =  json['credit_id'];
    this.gender =  json['gender'];
    this.id =  json['id'];
    this.name =  json['name'];
    this.order =  json['order'];
    this.profilePath =  json['profile_path'];
  }

  getProfilePhoto() {
    if(profilePath == null){
      return 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTesnspzmYPwsR6SMr-G6x-RYmtjwc_21C_6Q&usqp=CAU';
    }
    return 'https://image.tmdb.org/t/p/w500/$profilePath';
  }
}