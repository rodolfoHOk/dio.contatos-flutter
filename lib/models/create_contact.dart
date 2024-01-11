// ignore_for_file: unnecessary_getters_setters

class CreateContact {
  String _name = "";
  String _email = "";
  int _phoneNumber = 0;
  String _imageUrl = "";

  CreateContact(
      {required String name,
      required String email,
      required int phoneNumber,
      required String imageUrl}) {
    _name = name;
    _email = email;
    _phoneNumber = phoneNumber;
    _imageUrl = imageUrl;
  }

  String get name => _name;
  set name(String name) => _name = name;
  String get email => _email;
  set email(String email) => _email = email;
  int get phoneNumber => _phoneNumber;
  set phoneNumber(int phoneNumber) => _phoneNumber = phoneNumber;
  String get imageUrl => _imageUrl;
  set imageUrl(String imageUrl) => _imageUrl = imageUrl;

  CreateContact.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _email = json['email'];
    _phoneNumber = json['phoneNumber'];
    _imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = _name;
    data['email'] = _email;
    data['phoneNumber'] = _phoneNumber;
    data['imageUrl'] = _imageUrl;
    return data;
  }
}
