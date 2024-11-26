import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  String? _passwordError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Gradient Background
            Container(
              height: MediaQuery.of(context).size.height / 3.5,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF7E57C2), Color(0xFF2345FB)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(300, 105),
                ),
              ),
            ),
            // Sign-Up Form
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Center(
                    child: Text(
                      "Create a new account",
                      style: TextStyle(
                        color: Color(0xFFbbb0ff),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInputField(
                              label: "First Name",
                              hint: "Enter your first name",
                              icon: Icons.person_outline,
                            ),
                            const SizedBox(height: 20.0),
                            _buildInputField(
                              label: "Last Name",
                              hint: "Enter your last name",
                              icon: Icons.person_outline,
                            ),
                            const SizedBox(height: 20.0),
                            _buildInputField(
                              label: "Email",
                              hint: "Enter your email",
                              icon: Icons.mail_outline,
                            ),
                            const SizedBox(height: 20.0),
                            _buildInputField(
                              label: "Password",
                              hint: "Enter your password",
                              icon: Icons.lock_outline,
                              isPassword: true,
                              controller: _passwordController,
                            ),
                            const SizedBox(height: 20.0),
                            _buildInputField(
                              label: "Confirm Password",
                              hint: "Re-enter your password",
                              icon: Icons.lock_outline,
                              isPassword: true,
                              controller: _confirmPasswordController,
                              errorText: _passwordError,
                            ),
                            const SizedBox(height: 30.0),
                            Center(
                              child: InkWell(
                                onTap: _validatePassword,
                                child: Container(
                                  width: 130,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF6380fb),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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

  Widget _buildInputField({
    required String label,
    required String hint,
    required IconData icon,
    bool isPassword = false,
    TextEditingController? controller,
    String? errorText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10.0),
        Container(
          padding: const EdgeInsets.only(left: 10.0),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.0,
              color: Colors.black38,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: TextField(
            obscureText: isPassword,
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(icon),
              hintText: hint,
              errorText: errorText,
            ),
          ),
        ),
      ],
    );
  }

  void _validatePassword() {
    if (_passwordController.text != _confirmPasswordController.text) {
      setState(() {
        _passwordError = "Passwords do not match";
      });
    } else {
      setState(() {
        _passwordError = null;
      });
      // Proceed with sign-up logic
    }
  }
}
