import 'package:flutter/material.dart';

void main() {
  runApp(const PediatrikDozApp());
}

class PediatrikDozApp extends StatelessWidget {
  const PediatrikDozApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pediatrik Doz Hesaplama',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DozHesaplamaEkrani(),
    );
  }
}

class DozHesaplamaEkrani extends StatefulWidget {
  const DozHesaplamaEkrani({super.key});

  @override
  State<DozHesaplamaEkrani> createState() => _DozHesaplamaEkraniState();
}

class _DozHesaplamaEkraniState extends State<DozHesaplamaEkrani> {
  final TextEditingController kiloController = TextEditingController();
  final TextEditingController yasController = TextEditingController();
  String sonuc = "";

  void dozHesapla() {
    final double? kilo = double.tryParse(kiloController.text);
    final int? yas = int.tryParse(yasController.text);

    if (kilo == null || yas == null) {
      setState(() {
        sonuc = "Lütfen geçerli değerler girin.";
      });
      return;
    }

    // Parasetamol: 15 mg/kg (max 1000 mg tek doz)
    double doz = kilo * 15;
    if (doz > 1000) doz = 1000;

    setState(() {
      sonuc =
          "Yaş: $yas yıl\nKilo: ${kilo.toStringAsFixed(1)} kg\n\nÖnerilen parasetamol dozu: ${doz.toStringAsFixed(0)} mg";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pediatrik Doz Hesaplama")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: yasController,
              decoration: const InputDecoration(
                labelText: "Yaş (yıl)",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: kiloController,
              decoration: const InputDecoration(
                labelText: "Kilo (kg)",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: dozHesapla,
              child: const Text("Hesapla"),
            ),
            const SizedBox(height: 20),
            Text(
              sonuc,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
