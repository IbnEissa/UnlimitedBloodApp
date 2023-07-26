import 'package:blood_nepal/SingleTonClasses/accounts.dart';
import 'package:blood_nepal/ui/home/orders/ordersData.dart';
import 'package:blood_nepal/ui/login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodeFirstName = FocusNode();
  final FocusNode _focusNodeMiddleName = FocusNode();
  final FocusNode _focusNodeLastName = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();
  final FocusNode _focusNodeConfirmPassword = FocusNode();

  String? _selectedBloodGroup;
  String? _selectedGender;
  String? birthDateInString;
  DateTime? birthDate;
  bool isDateSelected = false;

  final TextEditingController _controllerPhoneNumber = TextEditingController();
  final TextEditingController _controllerFirstName = TextEditingController();
  final TextEditingController _controllerMiddleName = TextEditingController();
  final TextEditingController _controllerLastName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerConFirmPassword =
      TextEditingController();

  // final Box _boxAccounts = Hive.box("login");
  bool _obscurePassword = true;
  var result = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            // backgroundColor: const Color.fromRGBO(255, 255, 255, 0.90),
            backgroundColor: const Color.fromRGBO(224, 224, 224, 0.65),
            // backgroundColor: const Color.fromRGBO(255, 71, 71, 0.70),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(children: [
                      const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "إنشاء حسابك",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.827,
                              child: TextFormField(
                                textAlign: TextAlign.right,
                                controller: _controllerFirstName,
                                focusNode: _focusNodeFirstName,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.person_outline,
                                        color: Colors.deepOrange[600]),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffE8ECF4), width: 1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffE8ECF4), width: 1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    fillColor: const Color(0xffE8ECF4),
                                    filled: true,
                                    hintText: "الاسم الاول ",
                                    hintStyle: const TextStyle(fontSize: 16)),
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return "إدخل اسمك الاول";
                                  }
                                  return null;
                                },
                                onEditingComplete: () =>
                                    _focusNodeMiddleName.requestFocus(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.827,
                              child: TextFormField(
                                textAlign: TextAlign.right,
                                controller: _controllerMiddleName,
                                focusNode: _focusNodeMiddleName,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.person_outline,
                                        color: Colors.deepOrange[600]),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffE8ECF4), width: 1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffE8ECF4), width: 1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    fillColor: const Color(0xffE8ECF4),
                                    filled: true,
                                    hintText: "الاسم الاوسط",
                                    hintStyle: const TextStyle(fontSize: 16)),
                                onEditingComplete: () =>
                                    _focusNodeLastName.requestFocus(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.827,
                              child: TextFormField(
                                textAlign: TextAlign.right,
                                controller: _controllerLastName,
                                focusNode: _focusNodeLastName,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.person_outline,
                                        color: Colors.deepOrange[600]),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffE8ECF4), width: 1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffE8ECF4), width: 1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    fillColor: const Color(0xffE8ECF4),
                                    filled: true,
                                    hintText: "اللقب",
                                    hintStyle: const TextStyle(fontSize: 16)),
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return "إدخل اللقب";
                                  }
                                  return null;
                                },
                                onEditingComplete: () =>
                                    _focusNodeMiddleName.requestFocus(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                          FontAwesomeIcons.venusMars,
                                          color: Colors.deepOrange[600],
                                          size: 20.0),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color(0xffE8ECF4),
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color(0xffE8ECF4),
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      fillColor: const Color(0xffE8ECF4),
                                      filled: true,
                                      hintText: "الجنس",
                                      hintStyle: const TextStyle(fontSize: 14)),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'الرجاء الاختيار';
                                    }
                                    return null;
                                  },
                                  items: <String>[
                                    'ذكر',
                                    'أنثى',
                                    'أخرى',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value,
                                          style: const TextStyle(fontSize: 16),
                                          textAlign: TextAlign.center),
                                    );
                                  }).toList(),
                                  value: _selectedGender,
                                  onChanged: (newValue) {
                                    _selectedGender = newValue!;
                                    setState(() {
                                      newValue;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: TextFormField(
                                    textAlign: TextAlign.right,
                                    controller: _controllerEmail,
                                    focusNode: _focusNodeEmail,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.email_outlined,
                                            color: Colors.deepOrange[600]),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color(0xffE8ECF4),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color(0xffE8ECF4),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        fillColor: const Color(0xffE8ECF4),
                                        filled: true,
                                        hintText: "البريد الالكتروني"),
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return "الرجاء ادخل بريدك الالكتروني";
                                      } else if (!(value.contains('@') &&
                                          value.contains('.'))) {
                                        return "بريد الكتروني غير صحيح";
                                      }
                                      return null;
                                    }),
                              ),
                            ]),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: TextFormField(
                          textAlign: TextAlign.right,
                          controller: _controllerPhoneNumber,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              // labelText: "رقم الهاتف",
                              labelStyle: const TextStyle(fontSize: 16),
                              prefixIcon: Icon(Icons.numbers,
                                  color: Colors.deepOrange[600]),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xffE8ECF4), width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xffE8ECF4), width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              fillColor: const Color(0xffE8ECF4),
                              filled: true,
                              hintText: "رقم الهاتف",
                              hintStyle: const TextStyle(
                                fontSize: 16,
                              )),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "الرجاء أدخل رقماَ صحيحاً";
                            } else if (value.length != 10) {
                              return "Phone number is invalid.";
                            }
                            return null;
                          },
                          onEditingComplete: () =>
                              _focusNodeFirstName.requestFocus(),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: BoxDecoration(
                                  color: const Color(0xffE8ECF4),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 12.0),
                                child: GestureDetector(
                                    child: Row(
                                      children: [
                                        Icon(Icons.date_range_outlined,
                                            color: Colors.deepOrange[600],
                                            size: 25.0),
                                        const SizedBox(width: 10.0),
                                        SizedBox(
                                          width: 100,
                                          child: Text(
                                              isDateSelected
                                                  ? " $birthDateInString "
                                                  : "تاريخ الميلاد",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color:
                                                      Colors.deepOrange[700])),
                                        )
                                      ],
                                    ),
                                    onTap: () async {
                                      final datePick = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1900),
                                          lastDate: DateTime.now());
                                      if (datePick != null &&
                                          datePick != birthDate) {
                                        setState(() {
                                          birthDate = datePick;
                                          isDateSelected = true;
                                          birthDateInString =
                                              "${birthDate?.day}/${birthDate?.month}/"
                                              "${birthDate?.year}";
                                        });
                                      }
                                    }),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.bloodtype_outlined,
                                      color: Colors.deepOrange[600],
                                      size: 25.0,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffE8ECF4), width: 1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffE8ECF8), width: 1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    fillColor: const Color(0xffE8ECF4),
                                    filled: true,
                                    hintText: "فصيلة الدم",
                                    hintStyle: const TextStyle(fontSize: 14),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'الرجاء الاختيار';
                                    }
                                    return null;
                                  },
                                  items: <String>[
                                    'A+',
                                    'B+',
                                    'O+',
                                    'AB+',
                                    'A-',
                                    'B-',
                                    'O-',
                                    'AB-',
                                    'N/A'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value,
                                          style: const TextStyle(fontSize: 16),
                                          textAlign: TextAlign.right),
                                    );
                                  }).toList(),
                                  value: _selectedBloodGroup,
                                  onChanged: (newValue) {
                                    _selectedBloodGroup = newValue!;
                                    setState(() {
                                      newValue;
                                    });
                                  },
                                ),
                              ),
                            ]),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        child: TextFormField(
                          textAlign: TextAlign.right,
                          controller: _controllerPassword,
                          obscureText: _obscurePassword,
                          focusNode: _focusNodePassword,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              // prefixIcon: Icon(Icons.password_outlined,
                              //     color: Colors.deepOrange),
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
                                          Icons.visibility_outlined,
                                          color: Colors.deepOrange,
                                          textDirection: TextDirection.ltr,
                                        )),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xffE8ECF4), width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xffE8ECF4), width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              fillColor: const Color(0xffE8ECF4),
                              filled: true,
                              hintText: "كلمة المرور",
                              hintStyle: const TextStyle(
                                fontSize: 16,
                              )),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "الرجاء أدخل كلمة مرور";
                            } else if (value.length < 8) {
                              return "يجب أن تكون ثمانية أحرف على الاقل";
                            }
                            return null;
                          },
                          onEditingComplete: () =>
                              _focusNodeConfirmPassword.requestFocus(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextFormField(
                          textAlign: TextAlign.right,
                          controller: _controllerConFirmPassword,
                          obscureText: _obscurePassword,
                          focusNode: _focusNodeConfirmPassword,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              // prefixIcon: Icon(Icons.password_outlined,
                              //     color: Colors.deepOrange[600]),
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
                                          Icons.visibility_outlined,
                                          color: Colors.deepOrange,
                                        )),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xffE8ECF4), width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xffE8ECF4), width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              fillColor: const Color(0xffE8ECF4),
                              filled: true,
                              hintText: "تأكيد كلمة المرور",
                              hintStyle: const TextStyle(fontSize: 16)),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "الرجاء تأكيد كلمة المرور";
                            } else if (value != _controllerPassword.text) {
                              return "كلمة المرور غير متطابقة";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size.fromHeight(50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    width: 200,
                                    backgroundColor:
                                        Theme.of(context).colorScheme.secondary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    behavior: SnackBarBehavior.floating,
                                    content: const Text('تم التسجيل بنجاح '),
                                  ),
                                );

                                AccountsInfo().getObject().sendData(
                                      _controllerFirstName.text,
                                      _controllerMiddleName.text,
                                      _controllerLastName.text,
                                      '$_selectedGender',
                                      _controllerEmail.text,
                                      '$_selectedBloodGroup',
                                      '$birthDateInString',
                                      _controllerPhoneNumber.text,
                                      _controllerPassword.text,
                                      'add',
                                    );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Login(),
                                  ),
                                );
                              },
                              child: const Text("حفظ",
                                  style: TextStyle(fontSize: 20))),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "أمتلك حساباُ?",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 15),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("تسجيل دخول",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.deepOrange)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ])))));
  }

  @override
  void dispose() {
    _focusNodeEmail.dispose();
    _focusNodePassword.dispose();
    _focusNodeConfirmPassword.dispose();
    _controllerPhoneNumber.dispose();
    _controllerFirstName.dispose();
    _controllerMiddleName.dispose();
    _controllerLastName.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    _controllerConFirmPassword.dispose();
    super.dispose();
  }
}
