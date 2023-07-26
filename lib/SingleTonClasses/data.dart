class Data {
  final int id;
  final String fName;
  final String mName;
  final String lName;
  final String gender;
  final String email;
  final String bloodGroup;
  final String birthDate;
  final String phoneNumber;
  final String password;

  Data({
    required this.id,
    required this.fName,
    required this.mName,
    required this.lName,
    required this.gender,
    required this.email,
    required this.bloodGroup,
    required this.birthDate,
    required this.phoneNumber,
    required this.password,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      fName: json['fName'],
      mName: json['mName'],
      lName: json['lName'],
      gender: json['gender'],
      email: json['email'],
      bloodGroup: json['bloodGroup'],
      birthDate: json['birthDate'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
    );
  }
}
