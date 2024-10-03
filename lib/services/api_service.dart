import 'package:avengers/models/avenger_model.dart';
import 'package:dio/dio.dart';


class ApiService {
  final Dio _dio = Dio();


  Future<List<Avenger>> listAvengers() async {
    final response = await _dio.get(
      'https://www.superheroapi.com/api.php/d8dcb23bac7d183c6253a09952172fa2/332.json',
    );

    if (response.statusCode == 200) {
      List<dynamic> avengersJson = response.data['connections'];
      return avengersJson.map((json) => Avenger.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Avengers');
    }
  }
}