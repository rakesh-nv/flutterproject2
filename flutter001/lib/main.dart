import 'package:flutter/material.dart';
import 'package:flutter001/IntroPage.dart';
import 'package:flutter001/Forgotpsw.dart';
import 'package:flutter001/home.dart';
import 'package:flutter001/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter001',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      //home: forgotpsw(),
      //home: const MyHomePage(title: 'flutter demo'),
      home: home(),
      // home: SplashScreen(),
    );
  }
}

// login Screen
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void despose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  vallidateForm() {
    bool isValid = false;
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      setState(() {
        isValid = true;
      });
    } else {
      setState(() {
        isValid = false;
      });
    }
    return isValid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Login Page',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Image.asset('assets/img/imgflutter.png',
                    height: 100, width: 300)),
            const SizedBox(height: 20),

            //Email controller
            TextFormField(
              controller: emailController,
              onChanged: (value) {
                vallidateForm();
              },
              decoration: InputDecoration(
                hintText: 'Enter the email',
                prefixIcon: const Icon(Icons.email),

                // hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            const SizedBox(height: 10),

            /// Password Controller
            TextFormField(
              controller: passwordController,
              onChanged: (value) {
                vallidateForm();
              },
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye),
                ),
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            //const SizedBox(height: 20),

            // Forgot Password
            TextButton(
              onPressed: () {
                debugPrint('forgot password');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Forgotpsw(),
                    ));
              },
              child: const Text('Forgot Password',
                  style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.w600)),
            ),
            // const SizedBox(height: 20),
            // const SizedBox(height:20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // width: MediaQuery.of(context).size.width / 2,

                // Signup Button
                ElevatedButton(
                  onPressed: () {
                    debugPrint('Sign up');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Intropage(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      textStyle: const TextStyle(fontWeight: FontWeight.bold)),
                  child: const Text('Signup',
                      style: TextStyle(color: Colors.white)),
                ),

                //width: MediaQuery.of(context).size.width / 2,

                // Log in button
                ElevatedButton(
                  onPressed: vallidateForm()
                      ? () {
                          debugPrint(emailController.text);
                          debugPrint(passwordController.text);
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => home(),
                            ),
                            (route) => false,
                          );
                        }
                      : () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          vallidateForm() ? Colors.blue : Colors.grey,
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      textStyle: const TextStyle(fontWeight: FontWeight.bold)),
                  child: const Text('Login',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
