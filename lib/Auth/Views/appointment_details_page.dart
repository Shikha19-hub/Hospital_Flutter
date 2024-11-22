import 'package:flutter/material.dart';

class AppointmentDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Appointment Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text('Details of your appointment will be displayed here.'),
      ),
    );
  }
}
