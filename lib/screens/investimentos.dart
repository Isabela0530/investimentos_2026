import 'dart:math';
import 'package:flutter/material.dart';

class Investimentos extends StatefulWidget {
  const Investimentos({super.key});

  @override
  State<Investimentos> createState() => _InvestimentosState();
}

class _InvestimentosState extends State<Investimentos> {
  double valorMensal = 0;
  int meses = 0;
  double taxa = 0;

  double totalSemJuros = 0;
  double totalComJuros = 0;

  void calcular() {
    double i = taxa / 100;

    if (valorMensal > 0 && meses > 0) {
      totalSemJuros = valorMensal * meses;

      if (i > 0) {
        totalComJuros =
            valorMensal * ((pow(1 + i, meses) - 1) / i);
      } else {
        totalComJuros = totalSemJuros;
      }
    } else {
      totalSemJuros = 0;
      totalComJuros = 0;
    }

    setState(() {});
  }

  void mostrarResultado() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Resultado"),
        content: Text(
          "Valor total com juros: R\$ ${totalComJuros.toStringAsFixed(2)}",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Investimentos"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: "Investimento mensal",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) =>
                    valorMensal = double.tryParse(value) ?? 0,
              ),
              const SizedBox(height: 15),

              TextField(
                decoration: const InputDecoration(
                  labelText: "Número de meses",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) =>
                    meses = int.tryParse(value) ?? 0,
              ),
              const SizedBox(height: 15),

              TextField(
                decoration: const InputDecoration(
                  labelText: "Taxa de juros ao mês (%)",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) =>
                    taxa = double.tryParse(value) ?? 0,
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  calcular();
                  mostrarResultado();
                },
                child: const Text("Simular"),
              ),

              const SizedBox(height: 20),

              Text(
                "Total sem juros: R\$ ${totalSemJuros.toStringAsFixed(2)}",
              ),
              Text(
                "Total com juros compostos: R\$ ${totalComJuros.toStringAsFixed(2)}",
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Voltar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}