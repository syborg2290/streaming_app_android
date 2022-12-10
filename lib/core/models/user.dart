class User {
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  String? username;
  String? stream_key;

  User(
      {this.firstname,
      this.lastname,
      this.email,
      this.password,
      this.username,
      this.stream_key});

  User.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    password = json['password'];
    username = json['username'];
    stream_key = json['stream_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['email'] = email;
    data['password'] = password;
    data['username'] = username;
    data['stream_key'] = stream_key;
    return data;
  }
}
