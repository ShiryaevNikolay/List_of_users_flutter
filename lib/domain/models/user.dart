class User {
  int? id;
  String? name;
  String? username;
  String? email;
  String? company;

  User({this.id, this.name, this.username, this.email, this.company});

  factory User.fromJcon(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    company: json["company"]["name"]
  );
}
