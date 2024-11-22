import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_system/Auth/Controller/HospitalController.dart';
import 'package:hospital_system/Auth/Views/dashboard_page.dart';
import 'package:hospital_system/Auth/Views/register_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final HospitalController hospitalController = Get.put(HospitalController());

    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            Obx(() {
              return hospitalController.isLoading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: () async {
                  final result = await hospitalController.login(
                    _emailController.text,
                    _passwordController.text,
                  );
                  if (result) {
                    // Navigate to Dashboard
                    Get.to(() => DashboardPage());
                  }
                },
                child: Text('Login'),
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
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                ); // Navigate to Register Page
              },
              child: Text('Don\'t have an account? Register here'),
            ),
          ],
        ),
      ),
    );
  }
}
