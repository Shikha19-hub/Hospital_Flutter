import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_system/Auth/Controller/HospitalController.dart';
import 'package:hospital_system/Auth/Model/patient_model.dart';
import 'package:hospital_system/Auth/Views/login_page.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final HospitalController hospitalController = Get.put(HospitalController());

    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _genderController,
              decoration: InputDecoration(labelText: 'Gender'),
            ),
            SizedBox(height: 20),
            Obx(() {
              return hospitalController.isLoading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: () async {
                  final patient = Patient(
                    id: '',
                    name: _nameController.text,
                    email: _emailController.text,
                    password: _passwordController.text,
                    age: int.parse(_ageController.text),
                    gender: _genderController.text,
                  );

                  final result = await hospitalController.registerPatient(patient);
                  if (result) {
                    Get.toNamed('/login'); // Navigate to Login page on successful registration
                  }
                },
                child: Text('Register'),
              );
            }),
            Obx(() {
              return Text(
                hospitalController.errorMessage.value,
                style: TextStyle(color: Colors.red),
              );
            }),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                ); // Navigate to Register Page
              },
              child: Text('Do you have an account? Login here'),
            ),
          ],
        ),
      ),
    );
  }
}
