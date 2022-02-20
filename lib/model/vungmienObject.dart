class VungMienObject {
  final int id;
  final String tenvung;


  VungMienObject(this.id,this.tenvung);

  VungMienObject.fromJson(Map<String,dynamic>vm)
      : id = vm["id"],
        tenvung=vm["tenvung"];

}