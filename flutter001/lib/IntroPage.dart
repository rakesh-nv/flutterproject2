import 'package:flutter/material.dart';
import 'package:flutter001/main.dart';

class Intropage extends StatefulWidget {
  const Intropage({super.key});

  @override
  State<Intropage> createState() => _IntropageState();
}

class _IntropageState extends State<Intropage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  void despose() {
    nameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    cityController.dispose();
    super.dispose();
  }

  vallidateForm() {
    bool isValid = false;
    if (nameController.text.isNotEmpty &&
        phoneNumberController.text.length == 10 &&
        emailController.text.isNotEmpty &&
        cityController.text.isNotEmpty) {
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Intro page'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              const Text(
                'Register',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: nameController,
                onChanged: (value) {
                  vallidateForm();
                },
                decoration: InputDecoration(
                    hintText: 'Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4))),
              ),

              // phon number
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: phoneNumberController,
                onChanged: (value) {
                  vallidateForm();
                },
                decoration: InputDecoration(
                    hintText: 'Phone number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4))),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                onChanged: (value) {
                  vallidateForm();
                },
                decoration: InputDecoration(
                    hintText: 'email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4))),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: cityController,
                onChanged: (value) {
                  vallidateForm();
                },
                decoration: InputDecoration(
                    hintText: 'city',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4))),
              ),
              const SizedBox(height: 20),
              Center(
                // submit button
                child: ElevatedButton(
                  onPressed: vallidateForm()
                      ? () {
                          debugPrint(nameController.text);
                          debugPrint(phoneNumberController.text);
                          debugPrint(emailController.text);
                          debugPrint(cityController.text);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MyApp(),
                              ));
                        }
                      : () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          vallidateForm() ? Colors.blue : Colors.grey,
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      textStyle: const TextStyle(fontWeight: FontWeight.bold)),
                  child: const Text('Submit',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
