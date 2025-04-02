import 'package:flutter/material.dart';

class TikTokLoginPage extends StatelessWidget {
  const TikTokLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          _buildBackground(),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 50),
                  _buildTitle(),
                  const SizedBox(height: 24),
                  _buildLoginOption(
                    icon: Icons.mail_outline,
                    text: "Tiếp tục với Email",
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                    borderColor: Colors.red,
                    onTap: () {
                      Navigator.pushNamed(context, '/login_email_page');
                    },
                  ),
                  _buildLoginOption(
                    icon: Icons.facebook,
                    text: "Tiếp tục với Facebook",
                    backgroundColor: Colors.blue,
                    textColor: Colors.white,
                    onTap: () {},
                  ),
                  _buildLoginOption(
                    icon: Icons.apple,
                    text: "Tiếp tục với Apple",
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    onTap: () {},
                  ),
                  _buildLoginOption(
                    icon: Icons.g_mobiledata,
                    text: "Tiếp tục với Google",
                    backgroundColor: Colors.amber,
                    textColor: Colors.black,
                    onTap: () {},
                  ),
                  const SizedBox(height: 16),
                  _buildDividerWithText(),
                  const SizedBox(height: 50),
                  _buildSignUpPrompt(),
                  const SizedBox(height: 16),
                  _buildTermsAndConditions(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      color: Colors.white, // Màu nền trắng
    );
  }

  Widget _buildTitle() {
    return Column(
      children: const [
        Text(
          "Đăng nhập vào TikTok",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        Text(
          "Khám phá thêm nhiều nội dung thú vị",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildLoginOption({
    required IconData icon,
    required String text,
    Color? backgroundColor,
    Color? textColor,
    Color? borderColor,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, color: textColor ?? Colors.black),
        label: Text(
          text,
          style: TextStyle(color: textColor ?? Colors.black),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.white,
          side: BorderSide(color: borderColor ?? Colors.grey.shade300),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
    );
  }

  Widget _buildDividerWithText() {
    return Row(
      children: [
        Expanded(
          child: Divider(color: Colors.black26),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Hoặc",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Expanded(
          child: Divider(color: Colors.black26),
        ),
      ],
    );
  }

  Widget _buildSignUpPrompt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Bạn không có tài khoản? ",
          style: TextStyle(color: Colors.black54),
        ),
        GestureDetector(
          onTap: () {},
          child: const Text(
            "Đăng ký",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTermsAndConditions() {
    return Text(
      "Bằng việc tiếp tục với tài khoản, bạn đồng ý với Điều khoản Dịch vụ và Chính sách Quyền riêng tư của chúng tôi.",
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 12, color: Colors.black54),
    );
  }
}
