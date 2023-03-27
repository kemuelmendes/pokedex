class User {
  String? user;
  String? mail;
  String? password;
  bool? keepOn;

  User({this.user, this.mail, this.password, this.keepOn, required email});

  User.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    mail = json['mail'];
    password = json['password'];
    keepOn = json['keepOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.user;
    data['mail'] = this.mail;
    data['password'] = this.password;
    data['keepOn'] = this.keepOn;
    return data;
  }

  String toString() {
    return "Name: " "\nE-mail: " + "\nPassword: ";
  }
}
