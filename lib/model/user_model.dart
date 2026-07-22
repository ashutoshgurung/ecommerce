class UserModel {

  final String uid;
  final String name;
  final String email;
  final String photo;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.photo,
  });


  Map<String,dynamic> toMap(){

    return {
      "uid":uid,
      "name":name,
      "email":email,
      "photo":photo,
    };

  }


  factory UserModel.fromMap(Map<String,dynamic> map){

    return UserModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      photo: map['photo'],
    );

  }

}