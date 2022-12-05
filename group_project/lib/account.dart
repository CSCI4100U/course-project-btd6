class Acc{
  String? title;
  String? color;
  String? location;

  Acc({this.title,this.color,this.location});

  String toString(){
    return '($title), Color: $color, Location: $location';
  }

  Acc.fromMap(Map map){
    this.title = map['title'];
    this.color = map['color'];
    this.location = map['location'];
  }

  Map<String, Object?> toMap(){
    return {
      'title': this.title,
      'color': this.color,
      'location': this.location,
    };
  }
}

