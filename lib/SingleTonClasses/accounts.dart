import 'dart:convert';

import 'package:http/http.dart' as http;

class AccountsInfo {
  var _id;
  var _fName;
  var _mName;
  var _lName;
  var _gender;
  var _bloodGroup;
  var _email;
  var _birthDate;
  var _phoneNumber;
  var _password;
  late AccountsInfo _info;
  late JsonDecoder accountsList;

  AccountsInfo() {
    _info = AccountsInfo();
    accountsList = JsonDecoder();
  }



  Future<bool> sendData(
      String fName,
      String mName,
      String lName,
      String gender,
      String email,
      String bloodGroup,
      String birthDate,
      String phoneNumber,
      String password,
      String Controller) async {
    //   final response = await http.post(
    //     // Uri.parse('http://192.168.43.1:8080/UnlimitedBlood/newSignUp.php'),
    //     Uri.parse('http://localhost:8080/UnlimitedBlood/Services/Accounts.php'),
    //     body: {
    //       'fName': fName,
    //       'mName': mName,
    //       'lName': lName,
    //       'gender': gender,
    //       'bloodGroup': bloodGroup,
    //       'email': email,
    //       'birthDate': birthDate,
    //       'phoneNumber': phoneNumber,
    //       'password': password,
    //       'Controller': Controller,
    //     },
    //   );
    //
    //   if (response.statusCode == 200) {
    //     print("data inserted successfully");
    //     return true;
    //   } else {
    //     print("Error in data inserting ");
    //     return false;
    //   }
    // }
    // Uri.parse('http://localhost:8080/UnlimitedBlood/Services/Accounts.php'),
    final url = 'http://localhost/UnlimitedBlood/Services/Accounts.php';
    final data = {
      'fName': fName,
      'mName': mName,
      'lName': lName,
      'gender': gender,
      'bloodGroup': bloodGroup,
      'email': email,
      'birthDate': birthDate,
      'phoneNumber': phoneNumber,
      'password': password,
      'Controller': Controller,
      // ... add other data as needed
    };

    final response = await http.put(Uri.parse(url), body: data);
    final responseData = json.decode(response.body);

    if (responseData['Operation']) {
      print(responseData['message']);
      return true;
    } else {
      print(responseData['message']);
      return false;
    }
  }




  Future<bool> checkLogin(
      String phoneNumber, String password, String Controller) async {
    final response = await http.post(
      // Uri.parse('http://192.168.43.1:8080/UnlimitedBlood/newSignUp.php'),
      // Uri.parse('http://localhost:8080/UnlimitedBlood/Services/Accounts.php'),
      Uri.parse('http://localhost/UnlimitedBlood/Services/Accounts.php'),
      body: {
        'phoneNumber': phoneNumber,
        'password': password,
        'Controller': Controller,
      },
    );

    if (response.statusCode == 200) {
      print("Logged In successfully");
      return true;
    } else {
      print("Error in Logging In ");
      return false;
    }
  }

  AccountsInfo getObject() {
    if (_info == null) _info = new AccountsInfo();
    return _info;
  }

  bool checkItem(String type) {
    if (type != "add") {
      if (this._id.isNull) {
        return false;
      }
    }
    if (type != "delete") {
      if (this._fName.isNull) return false;
      if (this._mName.isNull) return false;
      if (this._lName.isNull) return false;
      if (this._phoneNumber.isNull) return false;
      if (this._email.isNull) return false;
      if (this._bloodGroup.isNull) return false;
      if (this._gender.isNull) return false;
    }

    return true;
  }

  //  Future <List> getAccountRow(int id) async{
  //  JsonEncoder row = null;
  //  if(AccountsInfo().getObject().accountsList!=null){
  //  for(int i=0;i<AccountInfo.getObject().Accounts.length();i++){
  //  if(AccountInfo.getObject().Accounts.getJSONObject(i).optInt("account_id",0)==id) {
  //  row = AccountInfo.getObject().Accounts.getJSONObject(i);
  //  break;
  //  }
  //
  //  }
  //  }
  //  return row;
}
