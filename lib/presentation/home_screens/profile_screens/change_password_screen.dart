import 'package:flutter/material.dart';
import 'package:foodigy/controller/user_contoller/password_controller.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/widgets/foodigy_button.dart';
import 'package:foodigy/widgets/foodigy_textfield.dart';
import 'package:foodigy/widgets/profile/profile_appbar.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController newPass = TextEditingController();
  TextEditingController conPass = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ProfileAppBar(text: 'Change Password'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              SettingsTextFormField(
                  hintText: 'New Password*',
                  controller: newPass,
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)")
                            .hasMatch(value)) {
                      return "Password must contain at least 8 characters, one uppercase, one number and one special case character";
                    } else {
                      return null;
                    }
                  }),
                  SizedBox(height: 10,),
              SettingsTextFormField(
                  hintText: 'Confirm Password*',
                  controller: conPass,
                  validator: (value) {
                    if (newPass.text != conPass.text) {
                      return "Password must match";
                    } else {
                      return null;
                    }
                  })
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            //height: 60,
            width: double.infinity,
            color: Colors.white,
            child: FoodigyButton(
              color: firstColor,
              onPressed: () {
                final form = formkey.currentState;
                if (form!.validate()) {
                  form.save();
                  PasswordController().changePassword(password: conPass.text);
                }
              },
              text: 'Update Password',
            ),
          ),
        ),
      ),
    );
  }
}
