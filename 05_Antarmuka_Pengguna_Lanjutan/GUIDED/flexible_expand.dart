import 'package:flutter/material.dart';

class FlexibleExpandedScreen extends StatelessWidget {
  const FlexibleExpandedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flexible vs Expanded"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          const Text(
            "Flexible",
            style: TextStyle(fontSize: 18),
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  height: 100,
                  color: Colors.blue,
                  child: const Center(child: Text('Flexible 1')),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  height: 100,
                  color: Colors.green,
                  child: const Center(child: Text('Flexible 2')),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20), // Jarak antara widget
          const Text(
            "Expanded",
            style: TextStyle(fontSize: 18),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  color: Colors.red,
                  child: const Center(child: Text('Expanded 1')),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  color: Colors.orange,
                  child: const Center(child: Text('Expanded 2')),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
