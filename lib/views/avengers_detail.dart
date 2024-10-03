import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/avenger_model.dart';


class AvengersDetailPage extends StatelessWidget {
  final Avenger avenger;

  AvengersDetailPage({required this.avenger});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          avenger.name,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(avenger.image),
            SizedBox(height: 10),

            Text(
              avenger.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),

            Text(
              '${avenger.connections}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}