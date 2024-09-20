import 'package:flutter/material.dart';
import 'signup.dart';
import '../firebase/auth.dart'; 
import '../tasks/task_home.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService(); 

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Create Your Account'),
      //   centerTitle: true,
      // ),
      body: Padding(
          padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ColorFiltered(
              //   colorFilter: ColorFilter.mode(
              //     Colors.transparent, // Color to be used
              //     BlendMode.multiply, // Blend mode to remove white
              //   ),
              //   child: Image.asset('assets/login.png'),
              // ),
              Image.asset("assets/login.png",
              height: 250,),
                  
              const Text(
                "Welcome Back !",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
              ),
                  
              const SizedBox(
                height: 20,
              ),
              // Email Field
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email",
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                ),
              ),
            TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16), 
                    borderSide: const BorderSide(
                      color: Colors
                          .grey, 
                      width: 2.0,
                    ),
                  ),

               
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color:
                          Color(0xFF6C63FF), 
                      width: 2.0, 
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Password Field
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16), 
                    borderSide: const BorderSide(
                      color: Colors
                          .grey, 
                      width: 2.0, 
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color:
                          Color(0xFF6C63FF), 
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
                  
              // Sign-Up Button
              ElevatedButton(
                onPressed: ()async {
                  String email = _usernameController.text.trim();
                  String password = _passwordController.text.trim();

                  if (email.isEmpty || password.isEmpty) {
                    // Show an alert if fields are empty
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter both email and password')),
                    );
                    return;
                  }

                
                  var user = await _authService.signInWithEmailAndPassword(email, password);
                  if (user != null) {
                 
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Sign-Up Successful')),
                    );
                
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => TaskHome())
                    );

                  } else {
                   
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Login Failed')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  backgroundColor: const Color(0xFF6C63FF),
                  
              ),
                child: const Text('Log in',
                style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white),
                )),
              const SizedBox(height: 12),
                  
              // Log in Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Create a new account"),
                  TextButton(
                    onPressed: () {
                      // Handle log-in navigation
                      Navigator.pop(context);
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context)=> SignUpPage() )
                      );
                    },
                    child: const Text('Sign in'),
                  ),
                ],
              ),
              Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
 
    Container(
      width: 60, 
      height: 60,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF4267B2), 
      ),
      child: IconButton(
        onPressed: () {
          
        },
        icon: const Icon(Icons.facebook),
        color: Colors.white
      ),
    ),
    const SizedBox(width: 16), 

    // Google Button
    Container(
      width: 60,
      height: 60,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFDB4437), 
      ),
      child: IconButton(
        onPressed: () {
        },
        icon: const Icon(Icons.mail),
        color: Colors.white,
      ),
    ),
    const SizedBox(width: 16), 

    // Apple Button
    Container(
      width: 60,
      height: 60,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black, 
      ),
      child: IconButton(
        onPressed: () {
        
        },
        icon: const Icon(Icons.apple),
        color: Colors.white,
      ),
    ),
  ],
)

            ],
          ),
        ),
      ),
    );
  }
}
