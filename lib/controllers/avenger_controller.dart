import 'package:avengers/models/avenger_model.dart';
import 'package:get/get.dart';
import '../services/api_service.dart';

class AvengerController extends GetxController {
  var avengers = <Avenger>[].obs;
  var isLoading = true.obs;
  final ApiService apiService = ApiService();

  @override
  void onInit() {
    listAvengers();
    super.onInit();
  }

  Future<void> listAvengers() async {
    try {
      isLoading(true);
      var avengerList = await apiService.listAvengers();
      avengers.value = avengerList;
    } finally {
      isLoading(false);
    }
  }
}