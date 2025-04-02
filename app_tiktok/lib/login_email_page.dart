import 'package:app_tiktok/Ultis/login_service.dart';
import 'package:app_tiktok/enity/auth/login_request.dart';
import 'package:app_tiktok/enity/auth/login_response.dart';
import 'package:app_tiktok/home_page.dart';
import 'package:flutter/material.dart';

class LoginEmailPage extends StatelessWidget {
  const LoginEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    bool isEmail(String email) {
      String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
      RegExp regex = RegExp(emailPattern);
      return regex.hasMatch(email);
    }

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(height: 100),
                _buildTitle(),
                const SizedBox(height: 100),
                _buildEmailField(emailController, isEmail),
                const SizedBox(height: 16.0),
                _buildPasswordField(passController),
                const SizedBox(height: 16.0),
                _buildRememberMe(),
                const SizedBox(height: 30),
                _buildContinueButton(
                    context, formKey, emailController, passController),
                const SizedBox(height: 50),
                _buildSocialButtons(),
                const SizedBox(height: 16.0),
                _buildSignUpPrompt(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Phương thức xây dựng tiêu đề
  Widget _buildTitle() {
    return const Column(
      children: [
        Text(
          "Welcome To TikTok ",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        Text(
          "Sign in with your email and password or continue with social media",
          maxLines: 2,
          style: TextStyle(color: Colors.grey, fontSize: 15),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // Phương thức xây dựng trường Email
  Widget _buildEmailField(
      TextEditingController emailController, bool Function(String) isEmail) {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        suffixIcon: const Icon(Icons.email_outlined),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter your email!";
        } else if (!isEmail(value)) {
          return "The email format is incorrect!";
        }
        return null;
      },
    );
  }

  // Phương thức xây dựng trường Mật khẩu
  Widget _buildPasswordField(TextEditingController passController) {
    return TextFormField(
      controller: passController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
        suffixIcon: const Icon(Icons.lock_outline),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password!';
        }
        return null;
      },
    );
  }

  // Phương thức xây dựng Checkbox "Remember me" và nút "Forgot Password"
  Widget _buildRememberMe() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: false,
              onChanged: (value) {},
            ),
            const Text("Remember me"),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Forgot Password",
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }

  String removeEmailDomain(String email) {
    return email.split('@').first;
  }

  // Phương thức xây dựng nút "Continue"
  Widget _buildContinueButton(
      BuildContext context,
      GlobalKey<FormState> formKey,
      TextEditingController emailController,
      TextEditingController passController) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            String email = removeEmailDomain(emailController.text);
            LoginResponse? result = await LoginService.login(
                LoginRequest(email: email, password: passController.text));
            if (result != null) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomePage(
                            accessToken: result.accessToken,
                          )));
            }
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16.0),
        ),
        child: const Text(
          "Continue",
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }

  // Phương thức xây dựng các nút social media
  Widget _buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Colors.grey[200],
          child: const Icon(Icons.g_mobiledata, size: 28.0),
        ),
        const SizedBox(width: 16.0),
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Colors.grey[200],
          child: const Icon(Icons.facebook, color: Colors.blue),
        ),
        const SizedBox(width: 16.0),
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Colors.grey[200],
          child: const Icon(Icons.apple, size: 24.0),
        ),
      ],
    );
  }

  // Phương thức xây dựng liên kết "Sign Up"
  Widget _buildSignUpPrompt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don’t have an account? "),
        GestureDetector(
          onTap: () {},
          child: const Text(
            "Sign Up",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
