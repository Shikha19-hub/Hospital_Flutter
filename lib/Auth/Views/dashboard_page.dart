import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_system/Auth/Controller/HospitalController.dart';
import 'package:hospital_system/Auth/Views/appointment_details_page.dart';
import 'package:hospital_system/Auth/Views/doctor_details_page.dart';

class DashboardPage extends StatelessWidget {
  final HospitalController hospitalController = Get.put(HospitalController());

  @override
  Widget build(BuildContext context) {
    hospitalController.fetchDoctors(); // Fetch doctors on load

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Get.offAllNamed('/login'); // Redirect to login
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildWelcomeCard(),
            SizedBox(height: 20),
            _buildAppointmentsSection(),
            SizedBox(height: 20),
            _buildDoctorsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeCard() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to the Hospital System!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Manage your health effectively with us.'),
          ],
        ),
      ),
    );
  }

  Widget _buildAppointmentsSection() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Appointments',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text('Appointment with Dr. Smith'),
              subtitle: Text('Date: 2024-10-25, Time: 10:00 AM'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Get.to(() => AppointmentDetailsPage()); // Navigate to appointment details
              },
            ),
            TextButton(
              onPressed: () {
                Get.to(() => AppointmentDetailsPage()); // Navigate to all appointments (not implemented)
              },
              child: Text('View All Appointments'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDoctorsSection() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Available Doctors',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Obx(() {
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: hospitalController.doctors.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(hospitalController.doctors[index].name),
                    subtitle: Text(hospitalController.doctors[index].specialization),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Get.to(() => DoctorDetailsPage());
                    },
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
