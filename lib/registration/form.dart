import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:registration_form/services/auth_services.dart';
import '../main.dart';


class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _Registration();
}

class _Registration extends State<Registration> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _fathernameController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _fathernameController.dispose();
    _countryController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
  }

  //here i make firestore var and gave it all the properties of FirebaseFirestore
  FirebaseFirestore auth = FirebaseFirestore.instance;

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 10, 37, 1.0),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color:Color.fromRGBO(203, 161, 84, 1.0),
                        size: 30,
                      )),
                  SizedBox(
                    width: 70,
                  ),
                  Center(
                      child: Text('REGISTRATION',
                          style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromRGBO(203, 161, 84, 1.0),))),
                  SizedBox(
                    width: 10,
                  ),
                  Center(
                      child: Text("FORM",
                          style: TextStyle(
                              fontFamily: 'Pacifico',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromRGBO(203, 161, 84, 1.0),))),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  height: s.height,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromRGBO(203, 161, 84, 1.0),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      )),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Form(
                      key: formkey,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),

                          SizedBox(
                            height: 20,
                          ),
                          //name

                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Center(
                              child: Container(
                                height: 65,
                                width: 374,
                                // color: Color.fromRGBO(248, 248, 248, 1.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:Color.fromRGBO(203, 161, 84, 1.0),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                child: TextFormField(
                                  controller: _nameController,
                                  style:  const TextStyle(
                                    color: Colors.white,
                                  ),
                                  keyboardType: TextInputType.name,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "please enter name";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'NAME',
                                    hintStyle: TextStyle(color: Color.fromRGBO(203, 161, 84, 1.0),),
                                    icon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Icon(Icons.person,
                                            color:Color.fromRGBO(203, 161, 84, 1.0),),
                                        ),
                                        Container(
                                          width: 1,
                                          height: 30,
                                          margin: EdgeInsets.only(
                                              left: 10, right: 10),
                                          color: Color.fromRGBO(214, 214, 214,
                                              1.0), // Set the color of the line here
                                        ),
                                      ],
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //fathername

                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Center(
                              child: Container(
                                height: 65,
                                width: 374,
                                // color: Color.fromRGBO(248, 248, 248, 1.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:Color.fromRGBO(203, 161, 84, 1.0),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                child: TextFormField(
                                  controller: _fathernameController,
                                  style:  const TextStyle(
                                    color: Colors.white,
                                  ),
                                  keyboardType: TextInputType.name,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "please enter you father name";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Father Name',
                                    hintStyle: TextStyle(color: Color.fromRGBO(203, 161, 84, 1.0),),
                                    icon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Icon(Icons.person,
                                            color:Color.fromRGBO(203, 161, 84, 1.0),),
                                        ),
                                        Container(
                                          width: 1,
                                          height: 30,
                                          margin: EdgeInsets.only(
                                              left: 10, right: 10),
                                          color: Color.fromRGBO(214, 214, 214,
                                              1.0), // Set the color of the line here
                                        ),
                                      ],
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Center(
                              child: Container(
                                height: 65,
                                width: 374,
                                // color: Color.fromRGBO(248, 248, 248, 1.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromRGBO(203, 161, 84, 1.0),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                child: TextFormField(
                                  controller: _countryController,
                                  style:  const TextStyle(
                                    color: Colors.white,
                                  ),
                                  keyboardType: TextInputType.text,

                                  decoration: InputDecoration(
                                    hintText: 'Country',
                                    hintStyle: TextStyle(color:Color.fromRGBO(203, 161, 84, 1.0),),
                                    icon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Icon(Icons.location_city_outlined,
                                            color: Color.fromRGBO(203, 161, 84, 1.0),),
                                        ),
                                        Container(
                                          width: 1,
                                          height: 30,
                                          margin: EdgeInsets.only(
                                              left: 10, right: 10),
                                          color: Color.fromRGBO(214, 214, 214,
                                              1.0), // Set the color of the line here
                                        ),
                                      ],
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),


                          SizedBox(
                            height: 10,
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Center(
                              child: Container(
                                height: 65,
                                width: 374,
                                // color: Color.fromRGBO(248, 248, 248, 1.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromRGBO(203, 161, 84, 1.0),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                child: TextFormField(
                                  controller: _emailController,
                                  style:  const TextStyle(
                                    color: Colors.white,
                                  ),
                                  keyboardType: TextInputType.emailAddress,

                                  validator: (value) {
                                    if (!RegExp(
                                        "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                        .hasMatch(value!)) {
                                      return "please enter a Valid email";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'EMAIL',
                                    hintStyle: TextStyle(color:Color.fromRGBO(203, 161, 84, 1.0),),
                                    icon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Icon(Icons.email,
                                            color: Color.fromRGBO(203, 161, 84, 1.0),),
                                        ),
                                        Container(
                                          width: 1,
                                          height: 30,
                                          margin: EdgeInsets.only(
                                              left: 10, right: 10),
                                          color: Color.fromRGBO(214, 214, 214,
                                              1.0), // Set the color of the line here
                                        ),
                                      ],
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Center(
                              child: Container(
                                height: 65,
                                width: 374,
                                // color: Color.fromRGBO(248, 248, 248, 1.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromRGBO(203, 161, 84, 1.0),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                child: TextFormField(
                                  controller: _addressController,
                                  style:  const TextStyle(
                                    color: Colors.white,
                                  ),
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "please enter ADDRESS";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'ADDRESS',
                                    hintStyle: TextStyle(color: Color.fromRGBO(203, 161, 84, 1.0),),
                                    icon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Icon(Icons.location_city,
                                            color: Color.fromRGBO(203, 161, 84, 1.0),),
                                        ),
                                        Container(
                                          width: 1,
                                          height: 30,
                                          margin: EdgeInsets.only(
                                              left: 10, right: 10),
                                          color: Color.fromRGBO(214, 214, 214,
                                              1.0), // Set the color of the line here
                                        ),
                                      ],
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Center(
                              child: Container(
                                height: 65,
                                width: 374,
                                // color: Color.fromRGBO(248, 248, 248, 1.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromRGBO(203, 161, 84, 1.0),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                child: TextFormField(
                                  controller: _phoneController,
                                  style:  const TextStyle(
                                    color: Colors.white,
                                  ),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter a phone number';
                                    } else if (value.length != 11) {
                                      return 'Phone number must be 10 digits';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'PHONE NUMBER',
                                    hintStyle: TextStyle(color: Color.fromRGBO(203, 161, 84, 1.0),),
                                    icon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Icon(Icons.numbers,
                                            color:Color.fromRGBO(203, 161, 84, 1.0),),
                                        ),
                                        Container(
                                          width: 1,
                                          height: 30,
                                          margin: EdgeInsets.only(
                                              left: 10, right: 10),
                                          color: Color.fromRGBO(214, 214, 214,
                                              1.0), // Set the color of the line here
                                        ),
                                      ],
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Center(
                              child: Container(
                                height: 65,
                                width: 374,
                                // color: Color.fromRGBO(248, 248, 248, 1.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromRGBO(203, 161, 84, 1.0),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                child: TextFormField(
                                  controller: _passwordController,
                                  style:  const TextStyle(
                                    color: Colors.white,
                                  ),
                                  obscureText: true,

                                  // onChanged: (value){
                                  //   pass = value;
                                  // },

                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter a password';
                                    } else if (value!.length < 6) {
                                      return 'Password must be at least 6 characters';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'PASSWORD',
                                    hintStyle: TextStyle(color:Color.fromRGBO(203, 161, 84, 1.0),),
                                    icon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Icon(Icons.password,
                                            color:Color.fromRGBO(203, 161, 84, 1.0),),
                                        ),
                                        Container(
                                          width: 1,
                                          height: 30,
                                          margin: EdgeInsets.only(
                                              left: 10, right: 10),
                                          color: Color.fromRGBO(214, 214, 214,
                                              1.0), // Set the color of the line here
                                        ),
                                      ],
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 10,
                          ),


                          Center(
                            child: Container(
                              height: 60,
                              width: 374,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(203, 161, 84, 1.0),
                                //Colors.pink,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: InkWell(
                                onTap: () async {
                                  if (formkey.currentState!.validate()) {

                                    // await prefs.setString('email', '$email');
                                    // await prefs.setString('pass', '$pass');

                                    await AuthMethods().signUpUser(
                                      username: _nameController.text,
                                      address: _addressController.text,
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                      phone: _phoneController.text,
                                      country: _countryController.text,
                                      fatherName: _fathernameController.text,
                                      //
                                    ).then((value) =>
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Registration(),),),);
                                  }
                                },
                                child: Center(
                                    child: Text(
                                      'REGISTER',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
