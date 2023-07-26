import 'package:blood_nepal/ui/signup.dart';
import 'package:flutter/material.dart';

import '../SingleTonClasses/accounts.dart';
import 'home/home.dart';
import 'home/orders/ordersData.dart';

class Login extends StatefulWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final FocusNode _focusNodePassword = FocusNode();
  final TextEditingController _controllerPhoneNumber = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  AssetImage image = AssetImage('assets/images/me.png');
  bool _obscurePassword = true;
  String errorMessage = '';
  late String LoginState = '';

  @override
  Widget build(BuildContext context) {
    LoginState = 'false';
    // _boxLogin.put("loginStatus", true);
    //
    if (LoginState != 'false') {
      return Home();
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Center(
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF0056FF),
                Color(0xFF80ACFF),
                Color(0xFF80ACFF),
                Color(0xFF0050F3),
                Color(0xFFFFF5FB),
                Color(0xFFFFF5FB),
                Color(0xFFFFF5FB),
              ],
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 60),
              Container(
                  padding:
                      const EdgeInsets.only(top: 10, bottom: 10, right: 15),
                  child: Image.asset(
                    image.assetName,
                    height: 220,
                    width: 400,
                  )),
              const SizedBox(height: 30),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60)),
                  ),
                  child: ListView(
                    children: [
                      const SizedBox(height: 10),
                      Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            children: [
                              SizedBox(
                                child: TextFormField(
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  controller: _controllerPhoneNumber,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    labelText: "رقم الهاتف",
                                    labelStyle: const TextStyle(
                                      fontSize: 18,
                                    ),
                                    alignLabelWithHint: true,
                                    prefixIcon:
                                        const Icon(Icons.person_outline),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onEditingComplete: () =>
                                      _focusNodePassword.requestFocus(),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty
                                        // || value.length != 10
                                        ) {
                                      return "الرجاء أدخال رقم الهاتف";
                                    }
                                    //
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.right,
                                controller: _controllerPassword,
                                focusNode: _focusNodePassword,
                                obscureText: _obscurePassword,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  floatingLabelStyle: TextStyle(),
                                  labelText: "كلمة المرور",

                                  // suffixIcon:
                                  //     const Icon(Icons.password_outlined),
                                  labelStyle: const TextStyle(
                                    fontSize: 18,
                                  ),
                                  prefixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _obscurePassword = !_obscurePassword;
                                        });
                                      },
                                      icon: _obscurePassword
                                          ? const Icon(
                                              Icons.visibility_off_outlined)
                                          : const Icon(
                                              Icons.visibility_outlined)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return "الرجاءإدخال كلمة المرور ";
                                  }

                                  return null;
                                },
                              ),
                              const SizedBox(height: 5),
                              Text(errorMessage,
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                  textAlign: TextAlign.right),
                              const SizedBox(height: 40),
                              Column(
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                      minimumSize: const Size.fromHeight(50),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  onPressed: () async{
                                    Navigator.push(
                                         context,
                                         MaterialPageRoute(
                                           builder: (context) {
                                             return SliderPage();
                                           },
                                         ),
                                       );
                             }
                                    // onPressed: () async {
                                    //   bool loginResult = await AccountsInfo().checkLogin(
                                    //     _controllerPhoneNumber.text,
                                    //     _controllerPassword.text,
                                    //       "LogIn",
                                    //   );
                                    //
                                    //     print (loginResult);
                                    //   if (loginResult) {
                                    //     print ("the result = : $loginResult");
                                    //     Navigator.push(
                                    //       context,
                                    //       MaterialPageRoute(
                                    //         builder: (context) {
                                    //           return SliderPage();
                                    //         },
                                    //       ),
                                    //     );
                                    //   } else {
                                    //     print("error login");
                                    //   }
                                    // },
                                    // onPressed: () async {
                                    //
                                    //   // if (_formKey.currentState?.validate() ??
                                    //   //     false) {
                                    //   //   try {
                                    //   //     Map<String, dynamic> data =
                                    //   //         await checkLogin(
                                    //   //       _controllerPhoneNumber.text,
                                    //   //       _controllerPassword.text,
                                    //   //     );
                                    //   //     if (data["status"] == "success") {
                                    //   AccountsInfo().getObject().checkLogin(
                                    //       _controllerPhoneNumber.text,
                                    //       _controllerPassword.text,
                                    //       "LogIn");
                                    //   Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) {
                                    //         return SliderPage();
                                    //       },
                                    //     ),
                                    //   );
                                      //     //   errorMessage = "";
                                      //     LoginState = 'true';
                                      //     //     //   _boxLogin.put("phoneNumber",
                                      //     //     //       '_controllerPhoneNumber.text');
                                      //     //     //   _boxLogin.put("password",
                                      //     //     //       '_controllerPassword.text');
                                      //     //     //   _boxLogin.put(
                                      //     //     //       "fname", loginInfo["fname"]);
                                      //     //     //   _boxLogin.put(
                                      //     //     //       "mname", loginInfo["mname"]);
                                      //     //     //   _boxLogin.put(
                                      //     //     //       "address", loginInfo["address"]);
                                      //     //     //   _boxLogin.put(
                                      //     //     //       "lname", loginInfo["lname"]);
                                      //     //     //   _boxLogin.put(
                                      //     //     //       "gender", loginInfo["gender"]);
                                      //     //     //   _boxLogin.put("bloodGroup",
                                      //     //     //       loginInfo["bloodGroup"]);
                                      //     //     //   _boxLogin.put(
                                      //     //     //       "email", loginInfo["email"]);
                                      //     //     //   _boxLogin.put("birthDate",
                                      //     //     //       loginInfo["birthDate"]);
                                      //     //     //   _boxLogin.put("totalDonations",
                                      //     //     //       loginInfo["totalDonations"]);
                                      //     //     //   if (!mounted) return;
                                      //     //     navigateToHome(context);
                                      //     //   } else {
                                      //     //     setState(() {
                                      //     //       errorMessage = "Phone number or "
                                      //     //           "password is incorrect.";
                                      //     //     }
                                      //     //     );
                                      //   }
                                      //   print(
                                      //       'the value returned from the future method is :$data');
                                      // } catch (e) {
                                      //   // Handle the error
                                      //   print("the error is in : $e");
                                      // }
                                      // }
                                    // },
                                  ,  child: const Text("دخول",
                                        style: TextStyle(fontSize: 20)),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text("ليس لدي حساب?",
                                          style: TextStyle(fontSize: 15)),
                                      TextButton(
                                        onPressed: () {
                                          _formKey.currentState?.reset();

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return const Signup();
                                              },
                                            ),
                                          );
                                        },
                                        child: const Text("تسجيل حساب",
                                            style: TextStyle(fontSize: 17)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToHome(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => Home(),
        ),
      );
    });
  }

  // void checkLogin(String phoneNumber, String password) async {
  //   // final url = Uri.parse("http://10.0.2.2:8000/api/login");
  //   // final url = Uri.parse("http://localhost:99/UnlimitedBlood/login.php");
  //   try {
  //     final response = await http.post(
  //       Uri.parse("http://localhost:99/UnlimitedBlood/login.php"),
  //       body: {
  //         "phoneNumber": phoneNumber,
  //         "password": password,
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       final responseData = jsonDecode(response.body);
  //       print('Request failed with status: ${response.statusCode}');
  //       // print("the value returned from php is :$responseData");
  //       // return responseData;
  //     } else {
  //       print('Request failed with status: ${response.statusCode}');
  //       // return {'success': false};
  //     }
  //   } catch (error) {
  //     print('The error is $error');
  //     // return {'success': false};
  //   }
  // }

  // void checkLogin(String phoneNumber, String password) async {
  //   final response = await http.post(
  //     Uri.parse('http://localhost:8080/UnlimitedBlood/Services/Accounts.php'),
  //     body: {
  //       'phoneNumber': phoneNumber,
  //       'password': password,
  //     },
  //   );
  //
  //   if (response.statusCode == 200) {
  //     print("Logging in successfully");
  //   } else {
  //     print(
  //         "Error logging in: ${response.statusCode} ${response.reasonPhrase}");
  //   }
  // }
  // Future<Map<String, dynamic>> checkLogin(
  //     String phoneNumber, String password) async {
  //   final response = await http.put(
  //     // Uri.parse('http://192.168.43.1:99/unlimitedblood/newLogin.php'),
  //     Uri.parse('http://localhost:8080/unlimitedblood/newLogin.php'),
  //     // headers: {'Content-Type': 'application/json'},
  //     body: {
  //       'phoneNumber': phoneNumber,
  //       'password': password,
  //     },
  //   );
  //
  //   if (response.statusCode == 200) {
  //     // Parse the response body as JSON
  //     Map<String, dynamic> data = json.decode(response.body);
  //     return data;
  //   } else {
  //     throw Exception(
  //         "Error logging in: ${response.statusCode} ${response.reasonPhrase}");
  //   }
  // }

  @override
  void dispose() {
    // _focusNodePassword.dispose();
    // _controllerPhoneNumber.dispose();
    // _controllerPassword.dispose();
    // super.dispose();
  }
}
