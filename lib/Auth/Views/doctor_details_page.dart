import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_system/Auth/Model/doctor_model.dart';

class DoctorDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Doctor doctor = Get.arguments; // Get the passed doctor object

    return Scaffold(
      appBar: AppBar(title: Text(doctor.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${doctor.name}', style: TextStyle(fontSize: 22)),
            SizedBox(height: 10),
            Text('Specialization: ${doctor.specialization}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text('About the Doctor:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Dr. ${doctor.name} has extensive experience in ${doctor.specialization}.'),
          ],
        ),
      ),
    );
  }
}
