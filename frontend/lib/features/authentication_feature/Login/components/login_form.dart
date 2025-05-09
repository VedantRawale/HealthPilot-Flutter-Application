import 'package:flutter/material.dart';
import 'package:health_pilot/components/already_have_an_account_acheck.dart';
import 'package:health_pilot/components/constants.dart';
import 'package:health_pilot/home_page.dart';
import 'package:health_pilot/skeleton.dart';
import '../../Signup/signup_screen.dart';
import 'package:health_pilot/features/authentication_feature/data/datasources/remote/auth_remote_datasource.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
  try {
    final email = _emailController.text;
    final password = _passwordController.text;

    // Step 1: Call API and store tokens using remote data source
    final authRemoteDataSource = AuthRemoteDataSource(baseUrl: 'http://10.0.2.2:5000');
    await authRemoteDataSource.login(email: email, password: password);

    // Step 3: Navigate to your next screens
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => const Skeleton(),
    ));

  } catch (e) {
    print('Login error: $e');
    // Optionally show a snackbar or alert dialog here
  }
}


  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            controller: _emailController,
            decoration: const InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              controller: _passwordController,
              decoration: const InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
              onPressed: () async {
                await _login();
              },
              child: Text(
                "Login".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignUpScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
