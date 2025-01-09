import 'dart:convert';


class User {
  final String id;
  final String fullName;
  final String email;
  final String state;
  final String city;
  final String locality;
  final String password;
  final String token;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.state,
    required this.city,
    required this.locality,
    required this.password,
    required this.token,
  });
  //Serialization : Convert user object to a Map .
  //Map           : A Map is a collection of key value pairs.
  //Why           : Converting to a  map is an intermediate step that makes it easier to serialize.
  // The object to formaters like json for storage or trasmission.
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "fullName": fullName,
      "email": email,
      "state": state,
      "city": city,
      "locality": locality,
      "password": password,
      "token": token
    };
  }

  // Serialization : Convert map to json String.
  // This Method directly encode the data from the Map  into a Json String.
  String tojson() => json.encode(toMap());

//Deserialization : Convert  a map to a user object.
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map["_id"] as String? ?? "",
      fullName: map["fullName"] as String? ?? "",
      email: map["email"] as String? ?? "",
      state: map["state"] as String? ?? "",
      city: map["city"] as String? ?? "",
      locality: map["locality"] as String? ?? "",
      password: map["password"] as String? ?? "",
      token: map["token"] as String? ?? "",
    );
  }
  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
