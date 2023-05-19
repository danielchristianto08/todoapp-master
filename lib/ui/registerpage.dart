import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = '/register_page';
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isLoading = false;
  bool _obscureText = false;
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Container(),
              const SizedBox(height: 24),
              Text('Create your account'),
              const SizedBox(height: 24),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Email'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    // suffixIcon: IconButton(
                    //     onPressed: () {
                    //       setState(() {
                    //         _obscureText = !_obscureText;
                    //       });
                    //     },
                    //     icon: Icon((_obscureText)
                    //         ? Icons.visibility
                    //         : Icons.visibility_off)),
                    hintText: 'Password'),
              ),
              MaterialButton(
                height: 40,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                onPressed: () async {
                  setState(() {
                    _isLoading = true;
                  });
                  final email = _emailController.text;
                  final password = _passwordController.text;
                  final snackbar = SnackBar(content: Text(email));
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(password)));
                },
                child: Text('Register'),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Already have account? Login'))
            ],
          )),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
}
