import 'package:flutter/material.dart';

class Forgotpsw extends StatefulWidget {
  const Forgotpsw({super.key});

  @override
  State<Forgotpsw> createState() => _ForgotpswState();
}

class _ForgotpswState extends State<Forgotpsw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter the email',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4))),
            ),
            // Send OTP
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    print('forgot password');
                  },
                  child: const Text('Send OTP',
                      style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontWeight: FontWeight.w600)),
                ),

                // Resend OTP
                TextButton(
                  onPressed: () {
                    print('forgot password');
                  },
                  child: const Text('Resend OTP',
                      style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontWeight: FontWeight.w600)),
                ),
              ],
            ),

            // OTP
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'OTP',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4))),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 120),
              child: OutlinedButton(
                onPressed: () {
                  debugPrint('hello world');
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  'Submit',
                  style:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
