class UserObject {
  final int id;
  final String name;
  final String email;

  UserObject(this.id,this.name,this.email);

  UserObject.fromJson(Map<String,dynamic>us)
  : id= us["id"],
    name =us["name"],
    email=us["email"];
}
