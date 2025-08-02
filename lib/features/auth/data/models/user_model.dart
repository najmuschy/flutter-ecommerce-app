class UserModel{

  String id ;
  String firstName ;
  String lastName ;
  String email ;
  String phone ;
  String city;

  UserModel({required this.id, required this.firstName, required this.lastName, required this.email, required this.phone, required this.city}) ;

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      id: json['_id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phone: json['phone'],
      city: json['city'],
    ) ;
  }

  Map<String, dynamic> toJson(){
    return {
      id : id,
      firstName : firstName,
      lastName : lastName,
      email : email,
      phone : phone,
      city : city,
    };
  }
}