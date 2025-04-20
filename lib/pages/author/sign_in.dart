import 'package:flutter/material.dart';
import 'package:music_app/routes/route_names.dart';
import 'package:music_app/themes/app_colors.dart';
import 'package:music_app/themes/app_text_themes.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late TextEditingController _nameController;
  late TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateName(value) {
    if (value == null || value.isEmpty) {
      return "The name is required";
    }
    return null;
  }

  String? _validatePassword(value) {
    if (value == null || value.isEmpty) {
      return "The password is required";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dang nhap")),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildFormSignIn(),
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
            SizedBox(height: 24),
            Column(
              spacing: 12,
              children: [
                _buildSocialSignInButton(
                  "assets/images/social_icons/google.png",
                  "Dang nhap bang Google",
                  () {},
                ),
                _buildSocialSignInButton(
                  "assets/images/social_icons/facebook.png",
                  "Dang nhap bang Facebook",
                  () {},
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
                  Text("Chua co tai khoan?"),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RouteNames.signUp);
                    },
                    child: Text(
                      "Dang ky",
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

  GestureDetector _buildSocialSignInButton(
    String pathLogo,
    String text,

    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border(
            top: BorderSide(width: 1, color: AppColors.divider),
            left: BorderSide(width: 1, color: AppColors.divider),
            bottom: BorderSide(width: 2, color: AppColors.divider),
            right: BorderSide(width: 2, color: AppColors.divider),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 12,
          children: [
            Image.asset(pathLogo, width: 24, height: 24),
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

  Form _buildFormSignIn() {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 12,
        children: [
          _buildFieldForm("Your name", _nameController, _validateName),
          _buildFieldForm(
            "Your password",
            _passwordController,
            _validatePassword,
          ),
          SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {},
              child: Text("Dang nhap"),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField _buildFieldForm(
    String hintText,
    TextEditingController controller,

    FormFieldValidator? validator,
  ) {
    return TextFormField(
      controller: controller,
      validator: validator,

      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(width: 1),
        ),
      ),
    );
  }
}
