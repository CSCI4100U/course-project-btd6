class Acc{
  String? username;
  String? color;
  String? password;
  String? email;

  Acc({this.username,this.color,this.password,this.email});

  String toString(){
    return '($username), Password: $password, Email: $email, Color Scheme: $color';
  }

  Acc.fromMap(Map map){
    this.username = map['username'];
    this.color = map['color'];
    this.password = map['password'];
    this.email = map['email'];
  }

  Map<String, Object?> toMap(){
    return {
      'title': this.username,
      'color': this.color,
      'password': this.password,
      'email': this.email,
    };
  }
}

