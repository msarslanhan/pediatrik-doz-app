import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'data/ilaclar.dart';
import 'models/ilac.dart';

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

  String secilenIlac = '';
  String secilenYol = '';
  String sonuc = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pediatrik Doz Hesaplama")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("İlaç Seçimi:"),
              DropdownSearch<String>(
                popupProps: PopupProps.bottomSheet(
                  showSearchBox: true,
                  showSelectedItems: true,
                ),
                items: ilaclar.map((e) => e.isim).toList(),
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: const InputDecoration(
                    labelText: "İlaç seçin",
                    border: OutlineInputBorder(),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    secilenIlac = value ?? '';
                    secilenYol = '';
                    sonuc = '';
                  });
                },
                selectedItem: secilenIlac.isEmpty ? null : secilenIlac,
              ),
              const SizedBox(height: 16),
              const Text("Yol Seçimi:"),
              DropdownSearch<String>(
                popupProps: PopupProps.menu(
                  showSearchBox: true,
                ),
                items: secilenIlac.isEmpty
                    ? []
                    : ilaclar
                        .firstWhere((i) => i.isim == secilenIlac)
                        .yollar,
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: const InputDecoration(
                    labelText: "Yol seçin",
                    border: OutlineInputBorder(),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    secilenYol = value ?? '';
                    sonuc = '';
                  });
                },
                selectedItem: secilenYol.isEmpty ? null : secilenYol,
              ),
              const SizedBox(height: 16),
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
              Center(
                child: ElevatedButton(
                  onPressed: hesapla,
                  child: const Text("Dozu Hesapla"),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                sonuc,
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void hesapla() {
    final double? kilo = double.tryParse(kiloController.text);
    final double? yas = double.tryParse(yasController.text);

    if (kilo == null || yas == null || secilenIlac.isEmpty || secilenYol.isEmpty) {
      setState(() {
        sonuc = "Lütfen tüm alanları doldurun.";
      });
      return;
    }

    Ilac ilac = ilaclar.firstWhere((i) => i.isim == secilenIlac);
    double dozKg = ilac.dozlar[secilenYol]!['doz']!;
    double maxDoz = ilac.dozlar[secilenYol]!['max']!;

    double hesaplananDoz = kilo * dozKg;
    if (hesaplananDoz > maxDoz) hesaplananDoz = maxDoz;

    setState(() {
      sonuc =
          "İlaç: $secilenIlac\nYol: $secilenYol\nYaş: ${yas.toStringAsFixed(1)} yıl\nKilo: ${kilo.toStringAsFixed(1)} kg\n\nÖnerilen Doz: ${hesaplananDoz.toStringAsFixed(2)} mg";
    });
  }
}
