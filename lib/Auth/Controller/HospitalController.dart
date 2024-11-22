import 'package:get/get.dart';
import 'package:hospital_system/ApiService/api_service.dart';
import 'package:hospital_system/Auth/Model/patient_model.dart';
import 'package:hospital_system/Auth/Model/doctor_model.dart';

class HospitalController extends GetxController {
  RxBool isLoading = false.obs;
  var errorMessage = ''.obs;
  var doctors = <Doctor>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchDoctors(); // Fetch doctors when the controller is initialized
  }

  final ApiService _apiService = ApiService();

  Future<bool> registerPatient(Patient patient) async {
    isLoading.value = true;
    try {
      final response = await _apiService.register(patient);
      if (response.statusCode == 200) {
        errorMessage.value = 'Registration successful!';
        return true;
      } else {
        errorMessage.value = response.data['message'] ?? 'Registration failed';
        return false;
      }
    } catch (e) {
      errorMessage.value = 'Error: $e';
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> login(String email, String password) async {
    isLoading.value = true;
    try {
      final response = await _apiService.login(email, password);
      if (response.statusCode == 200) {
        errorMessage.value = 'Login successful!';
        return true;
      } else {
        errorMessage.value = response.data['message'] ?? 'Login failed';
        return false;
      }
    } catch (e) {
      errorMessage.value = 'Error: $e';
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<Doctor>> getDoctors() async {
    try {
      return await _apiService.fetchDoctors();
    } catch (e) {
      errorMessage.value = 'Error: $e';
      return [];
    }
  }
  Future<void> fetchDoctors() async {
    // Simulating network call
    await Future.delayed(Duration(seconds: 2));
    doctors.addAll([
      Doctor(name: 'Dr. Smith', specialization: 'Cardiologist'),
      Doctor(name: 'Dr. Jones', specialization: 'Dermatologist'),
      Doctor(name: 'Dr. Brown', specialization: 'Pediatrician'),
    ]);
  }
}
