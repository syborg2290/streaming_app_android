import 'dart:io';
import 'package:android_app/core/constants/pallete.dart';
import 'package:android_app/core/constants/size_config.dart';
import 'package:android_app/core/models/user.dart';
import 'package:android_app/ui/common/image_cropper.dart';
import 'package:android_app/ui/common/theme_helper.dart';
import 'package:android_app/ui/widgets/header_widget.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:android_app/core/services/user_service.dart';
import 'package:android_app/core/models/response.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  File? profile_image;
  bool checkedValue = false;
  bool checkboxValue = false;
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future modalBottomSheetImagePicker(BuildContext context) {
    return showMaterialModalBottomSheet(
      context: context,
      elevation: 8.0,
      builder: (context) => Container(
        height: SizeConfig.width! * 0.3,
        color: Colors.black,
        child: Column(
          children: [
            const Center(
              child: Text(
                "Choose your option",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    final XFile? image =
                        await _picker.pickImage(source: ImageSource.camera);
                    if (image != null) {
                      File file = File(image.path);
                      setState(() {
                        profile_image = file;
                      });
                      Navigator.pop(context);
                    }
                  },
                  child: Column(
                    children: const [
                      Icon(
                        MaterialCommunityIcons.camera,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text(
                        "Camera",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    final XFile? image =
                        await _picker.pickImage(source: ImageSource.gallery);
                    if (image != null) {
                      File file = File(image.path);
                      setState(() {
                        profile_image = file;
                      });
                      Navigator.pop(context);
                    }
                  },
                  child: Column(
                    children: const [
                      Icon(
                        MaterialCommunityIcons.image_frame,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text(
                        "Gallery",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> registerFunc() async {
    User userJson = User.fromJson({
      "firstname": fname.text.trim(),
      "lastname": lname.text.trim(),
      "email": email.text.trim(),
      "password": password.text.trim(),
      "username": username.text.trim(),
    });
    UserService _userService = UserService();
    Response res = await _userService.addUser(userJson);
    if (res.message == "success") {
      print(res.result);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Palette.appDarkColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 150,
              child: const HeaderWidget(
                  150, false, Icons.person_add_alt_1_rounded),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            modalBottomSheetImagePicker(context);
                          },
                          child: Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 5,
                                      color: profile_image != null
                                          ? Palette.appMainColor
                                          : Colors.white),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: profile_image != null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            SizeConfig.width! * 0.3),
                                        child: Image.file(
                                          profile_image!,
                                          width: SizeConfig.width! * 0.4,
                                          height: SizeConfig.width! * 0.4,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.person,
                                          color: Colors.grey.shade300,
                                          size: 80.0,
                                        ),
                                      ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  if (profile_image != null) {
                                    CustomImageCropper imageCropper =
                                        CustomImageCropper();
                                    File? cropped_image = await imageCropper
                                        .cropImageFunc(profile_image);
                                    if (cropped_image != null) {
                                      setState(() {
                                        profile_image = cropped_image;
                                      });
                                    }
                                  } else {
                                    modalBottomSheetImagePicker(context);
                                  }
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.black,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 20,
                                        offset: Offset(5, 5),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    profile_image != null
                                        ? Icons.crop
                                        : Icons.add_a_photo,
                                    color: Colors.white,
                                    size: 25.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                'First Name', 'Enter your first name'),
                            style: const TextStyle(
                                color: Palette.appDarkFontColor),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter your firstname";
                              }
                              return null;
                            },
                            controller: fname,
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                'Last Name', 'Enter your last name'),
                            style: const TextStyle(
                                color: Palette.appDarkFontColor),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter your lastname";
                              }
                              return null;
                            },
                            controller: lname,
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                "E-mail address", "Enter your email"),
                            style: const TextStyle(
                                color: Palette.appDarkFontColor),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if (!(val!.isEmpty) &&
                                  !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                      .hasMatch(val)) {
                                return "Enter a valid email address";
                              }
                              return null;
                            },
                            controller: email,
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                "Username", "Enter your username"),
                            style: const TextStyle(
                                color: Palette.appDarkFontColor),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter your username";
                              }
                              return null;
                            },
                            controller: username,
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration(
                                "Password*", "Enter your password"),
                            style: const TextStyle(
                                color: Palette.appDarkFontColor),
                            validator: (val) {
                              if (!(val!.isEmpty) &&
                                  !RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!#%*?&]{8,18}$")
                                      .hasMatch(val)) {
                                return "Password must have\n*Atleast one capital letter\n*One number\n*Special character\n*Length should be 8-18";
                              }
                              return null;
                            },
                            controller: password,
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 15.0),
                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white, width: 2),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5))),
                                      width: 24,
                                      height: 24,
                                      child: Checkbox(
                                          value: checkboxValue,
                                          activeColor: Palette.appMainColor,
                                          onChanged: (value) {
                                            setState(() {
                                              checkboxValue = value!;
                                              state.didChange(value);
                                            });
                                          }),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      "I accept all terms and conditions.",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Theme.of(context).errorColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                          validator: (value) {
                            if (!checkboxValue) {
                              return 'You need to accept terms and conditions';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "Register".toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                registerFunc();
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "I already have an account",
                            style: TextStyle(
                              color: Palette.appDarkFontColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
