import 'package:flutter/material.dart';
import 'investimentos.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simulador de Investimentos"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Investimentos(),
              ),
            );
          },
          child: const Text("Entrar"),
        ),
      ),
    );
  }
}