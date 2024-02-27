import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login Form'),
          backgroundColor: Colors.green[300],
        ),
        body: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  void initState(){
    super.initState();
  }
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
              
      
                labelText: 'Email',
                hintText: ("email@gmailcom"),
                prefixIcon:Icon(Icons.email) ,
                filled: true,
                fillColor: Colors.yellow[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                
                
              ),
              
              
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!_isValidEmail(value)) {
                  return 'Please enter a valid email address';
                }
                

                
                return null;
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true,
                fillColor: Colors.yellow[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  child: Icon(
                    _obscurePassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                )
            ),
            ),
            SizedBox(
              height: 16.0,
              width: 50.0,
            ),
            Row(
              children: [
                Checkbox(
                  value: _rememberMe,
                  onChanged: (value) {
                    setState(() {
                      _rememberMe = value ?? false;
                    });
                  },
                ),
                Text('Mw aksepe tout kondisyon yo poum fe pati platfom'),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[300]
              ),
              
              onPressed: () {
                bool ok=_formKey.currentState!.validate(); 
                if (ok){
      
                  print('Email: ${_emailController.text}');
                  print('Password: ${_passwordController.text}');
                  print('Remember Me: $_rememberMe');
                }
                //reinitialise form nan
                  _formKey.currentState!.reset();
                  _emailController.clear();
                  _passwordController.clear();
                  setState(() {
                    _rememberMe = false;
                    _obscurePassword = true;
                  });
               
              
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

bool _isValidEmail(String email) {
    String emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    return RegExp(emailRegex).hasMatch(email);
  }
 