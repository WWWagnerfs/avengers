import 'package:avengers/controllers/avenger_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class AvengersPage extends StatelessWidget {
  const AvengersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AvengerController avengerController = Get.put(AvengerController());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text('Avengers',style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold))),
      body: Obx(() {
        if (avengerController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (avengerController.avengers.isEmpty) {
          return Center(child: Text('No avengers found.'));
        }

        return ListView.builder(
          itemCount: avengerController.avengers.length,
          itemBuilder: (context, index) {
            final avenger = avengerController.avengers[index];
            return ListTile(
              leading: Image.network(avenger.image),
              title: Text(avenger.name),
              onTap: () {
                Get.to(() => AvengersPage());
              },
            );
          },
        );
      }),
    );
  }
}
