import 'package:flutter/material.dart';
import 'package:music_app/routes/route_names.dart';
import 'package:music_app/themes/app_colors.dart';
import 'package:music_app/themes/app_text_themes.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailConroller;
  late TextEditingController _passwordController;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailConroller = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();

    _emailConroller.dispose();

    _passwordController.dispose();
    super.dispose();
  }

  String? _validateName(value) {
    if (value == null || value.toString().trim().isEmpty) {
      return "The name is required";
    }
    return null;
  }

  String? _validateEmail(value) {
    if (value == null || value.toString().trim().isEmpty) {
      return "The email is required";
    }
    return null;
  }

  String? _validatePassword(value) {
    if (value == null || value.toString().trim().isEmpty) {
      return "The password is required";
    }
    if (value.toString().length < 6) {
      return "The password is at least 6 characters";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dang ky")),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            signUpForm(),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Hoac"),
                ),
                Expanded(child: Divider()),
              ],
            ),

            Column(
              spacing: 12,
              children: [
                _buildSocialSignUp(
                  logo: "assets/images/social_icons/google.png",
                  text: "Dang ky bang Google",
                  onTap: () {},
                ),
                _buildSocialSignUp(
                  logo: "assets/images/social_icons/facebook.png",
                  text: "Dang ky bang Facebook",
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: 24),
            DefaultTextStyle(
              style: AppTextTheme.lightTextTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 4,

                children: [
                  Text("Da co tai khoan?"),
                  GestureDetector(
                    onTap:
                        () => {Navigator.pushNamed(context, RouteNames.signIn)},
                    child: Text(
                      "Dang nhap",
                      style: TextStyle(
                        color: AppColors.primary,
                        decoration: TextDecoration.underline,
                      ),
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

  GestureDetector _buildSocialSignUp({
    required String logo,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border(
            top: BorderSide(width: 1, color: AppColors.divider),
            left: BorderSide(width: 1, color: AppColors.divider),
            right: BorderSide(width: 2, color: AppColors.divider),
            bottom: BorderSide(width: 2, color: AppColors.divider),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 12,
          children: [
            Image.asset(logo, width: 24, height: 24),
            Text(
              text,
              style: AppTextTheme.lightTextTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Form signUpForm() {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 12,
        children: [
          _buildTextFormField("Your name", _nameController, _validateName),
          _buildTextFormField("Your email", _emailConroller, _validateEmail),
          _buildTextFormField(
            "Your password",
            _passwordController,
            _validatePassword,
          ),

          Container(
            margin: EdgeInsets.only(top: 24),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                bool valid = _formKey.currentState!.validate();
                if (valid) {}
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text("Dang Ky"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextFormField(
    String name,
    TextEditingController controller, [
    FormFieldValidator? validator,
  ]) {
    return TextFormField(
      validator: validator,
      decoration: InputDecoration(
        hintText: name,
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
