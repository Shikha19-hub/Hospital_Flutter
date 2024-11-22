import 'package:dio/dio.dart';
import 'package:hospital_system/Auth/Model/patient_model.dart';
import 'package:hospital_system/Auth/Model/doctor_model.dart';
import 'package:hospital_system/Auth/Model/appointment_model.dart';

class ApiService {
  final Dio _dio = Dio();
  final String baseUrl = 'https://api.postman.com/collections/27509456-31a89bb2-eb26-4e65-8562-87fe6f6f4853?access_key=PMAT-01HRYCYJZBBFQG0V39RFJ87PYN'; // Replace with your backend URL

  Future<Response> register(Patient patient) async {
    final response = await _dio.post('${baseUrl}patients/register', data: patient.toJson());
    return response;
  }

  Future<Response> login(String email, String password) async {
    final response = await _dio.post('${baseUrl}patients/login', data: {
      'email': email,
      'password': password,
    });
    return response;
  }

  Future<List<Doctor>> fetchDoctors() async {
    final response = await _dio.get('${baseUrl}doctors');
    return (response.data as List).map((doc) => Doctor.fromJson(doc)).toList();
  }

  Future<Response> scheduleAppointment(Appointment appointment) async {
    final response = await _dio.post('${baseUrl}appointments', data: appointment.toJson());
    return response;
  }
}
