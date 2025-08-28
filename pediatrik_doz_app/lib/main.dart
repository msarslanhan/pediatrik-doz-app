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

class Ilac {
  final String isim;
  final Map<String, Map<String, double>> dozlar; // route -> {"doz": mg/kg, "max": max mg}
  final List<String> yollar; // aktif route seçenekleri

  Ilac({required this.isim, required this.dozlar, required this.yollar});
}

class _DozHesaplamaEkraniState extends State<DozHesaplamaEkrani> {
  final TextEditingController kiloController = TextEditingController();
  final TextEditingController yasController = TextEditingController();
  bool birYasAlti = true;
  String yasTipi = "Ay";

  String secilenIlac = "Parasetamol";
  String secilenRoute = "PO";

  String sonuc = "";

  final List<Ilac> ilaçlar = [
    Ilac(
      isim: "Parasetamol",
      dozlar: {
        "PO": {"doz": 15, "max": 90},
        "IV": {"doz": 15, "max": 90},
        "IM": {"doz": 15, "max": 90},
      },
      yollar: ["PO", "IV", "IM"],
    ),
    Ilac(
      isim: "Diazepam",
      dozlar: {
        "IV": {"doz": 1, "max": 10},
      },
      yollar: ["IV"],
    ),
    Ilac(
      isim: "Ibuprofen",
      dozlar: {
        "PO": {"doz": 10, "max": 40},
      },
      yollar: ["PO"],
    ),
  ];

  void dozHesapla() {
    final double? kilo = double.tryParse(kiloController.text);
    final int? yas = int.tryParse(yasController.text);

    if (kilo == null || yas == null) {
      setState(() {
        sonuc = "Lütfen geçerli değerler girin.";
      });
      return;
    }

    Ilac ilac = ilaçlar.firstWhere((i) => i.isim == secilenIlac);
    if (!ilac.yollar.contains(secilenRoute)) {
      setState(() {
        sonuc = "${secilenIlac} için $secilenRoute yolu uygun değil!";
      });
      return;
    }

    double dozKg = ilac.dozlar[secilenRoute]!["doz"]!;
    double maxDoz = ilac.dozlar[secilenRoute]!["max"]!;

    double hesaplananDoz = kilo * dozKg;
    if (hesaplananDoz > maxDoz) hesaplananDoz = maxDoz;

    String yasMetin = birYasAlti ? "$yas ay" : "$yas yıl";

    setState(() {
      sonuc =
          "Yaş: $yasMetin\nKilo: ${kilo.toStringAsFixed(1)} kg\nİlaç: $secilenIlac\nYol: $secilenRoute\n\nÖnerilen doz: ${hesaplananDoz.toStringAsFixed(1)} mg";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pediatrik Doz Hesaplama")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                const Text("Yaş: "),
                Radio<bool>(
                  value: true,
                  groupValue: birYasAlti,
                  onChanged: (value) {
                    setState(() {
                      birYasAlti = value!;
                      yasTipi = birYasAlti ? "Ay" : "Yıl";
                    });
                  },
                ),
                const Text("1 yaş altı"),
                Radio<bool>(
                  value: false,
                  groupValue: birYasAlti,
                  onChanged: (value) {
                    setState(() {
                      birYasAlti = value!;
                      yasTipi = birYasAlti ? "Ay" : "Yıl";
                    });
                  },
                ),
                const Text("1 yaş ve üstü"),
              ],
            ),
            TextField(
              controller: yasController,
              decoration: InputDecoration(
                labelText: "Yaş ($yasTipi)",
                border: const OutlineInputBorder(),
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
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: secilenIlac,
              items: ilaçlar
                  .map((i) => DropdownMenuItem(
                        value: i.isim,
                        child: Text(i.isim),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  secilenIlac = value!;
                  // Route seçeneklerini güncelle
                  Ilac ilac = ilaçlar.firstWhere((i) => i.isim == secilenIlac);
                  secilenRoute = ilac.yollar.first;
                });
              },
              decoration: const InputDecoration(
                labelText: "İlaç Seçin",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: secilenRoute,
              items: ilaçlar
                  .firstWhere((i) => i.isim == secilenIlac)
                  .yollar
                  .map((y) => DropdownMenuItem(
                        value: y,
                        child: Text(y),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  secilenRoute = value!;
                });
              },
              decoration: const InputDecoration(
                labelText: "Uygulama Yolu (Route)",
                border: OutlineInputBorder(),
              ),
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

class DozHesaplamaEkrani extends StatefulWidget {
  const DozHesaplamaEkrani({super.key});

  @override
  State<DozHesaplamaEkrani> createState() => _DozHesaplamaEkraniState();
}
