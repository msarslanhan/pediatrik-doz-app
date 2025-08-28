import '../models/ilac.dart';

final List<Ilac> ilaclar = [
  Ilac(
    isim: "Adrenalin",
    dozlar: {
      "IV": {"doz": 0.01, "max": 1.0},
      "IM": {"doz": 0.01, "max": 0.5},
      "SC": {"doz": 0.01, "max": 0.5},
      "ET": {"doz": 0.1, "max": 0.35},
    },
    yollar: ["IV", "IM", "SC", "ET"],
  ),
  Ilac(
    isim: "Ampisilin Sulbaktam",
    dozlar: {
      "PO": {"doz": 150, "max": 4000},
      "IM": {"doz": 150, "max": 4000},
      "IV": {"doz": 150, "max": 4000},
    },
    yollar: ["PO", "IM", "IV"],
  ),
  Ilac(
    isim: "Ampisilin",
    dozlar: {
      "PO": {"doz": 100, "max": 2000},
      "IM": {"doz": 200, "max": 12000},
      "IV": {"doz": 200, "max": 12000},
    },
    yollar: ["PO", "IM", "IV"],
  ),
  Ilac(
    isim: "Amikasin",
    dozlar: {
      "IV": {"doz": 15, "max": 20},
      "IM": {"doz": 15, "max": 20},
    },
    yollar: ["IV", "IM"],
  ),
  Ilac(
    isim: "Amoksilin",
    dozlar: {
      "PO": {"doz": 50, "max": 90},
    },
    yollar: ["PO"],
  ),
  Ilac(
    isim: "Amoksilin-Klavulanik Asit",
    dozlar: {
      "PO": {"doz": 40, "max": 45},
    },
    yollar: ["PO"],
  ),
  Ilac(
    isim: "Gentamisin",
    dozlar: {
      "IM": {"doz": 7.5, "max": 22.5},
      "IV": {"doz": 7.5, "max": 22.5},
    },
    yollar: ["IM", "IV"],
  ),
  Ilac(
    isim: "Ibuprofen",
    dozlar: {
      "PO": {"doz": 10, "max": 40},
    },
    yollar: ["PO"],
  ),
  Ilac(
    isim: "Ketamin",
    dozlar: {
      "IV": {"doz": 2, "max": 12},
      "IM": {"doz": 2, "max": 12},
      "PO": {"doz": 2, "max": 12},
    },
    yollar: ["IV", "IM", "PO"],
  ),
  Ilac(
    isim: "Klaritromisin",
    dozlar: {
      "PO": {"doz": 15, "max": 500},
    },
    yollar: ["PO"],
  ),
  Ilac(
    isim: "Klindamisin",
    dozlar: {
      "PO": {"doz": 20, "max": 2400},
      "IV": {"doz": 30, "max": 4800},
      "IM": {"doz": 30, "max": 4800},
    },
    yollar: ["PO", "IV", "IM"],
  ),
  Ilac(
    isim: "Levetirasetam",
    dozlar: {
      "PO": {"doz": 30, "max": 4000},
      "IV": {"doz": 60, "max": 4500},
    },
    yollar: ["PO", "IV"],
  ),
  Ilac(
    isim: "Metronidazol",
    dozlar: {
      "PO": {"doz": 30, "max": 4000},
      "IV": {"doz": 30, "max": 4000},
    },
    yollar: ["PO", "IV"],
  ),
  Ilac(
    isim: "Midapalam",
    dozlar: {
      "PO": {"doz": 0.5, "max": 5},
      "IM": {"doz": 0.2, "max": 5},
      "IV": {"doz": 0.2, "max": 5},
    },
    yollar: ["PO", "IM", "IV"],
  ),
  Ilac(
    isim: "Prednisolon",
    dozlar: {
      "PO": {"doz": 2, "max": 60},
      "IV": {"doz": 1, "max": 60},
    },
    yollar: ["PO", "IV"],
  ),
  Ilac(
    isim: "Vancomisin",
    dozlar: {
      "IV": {"doz": 60, "max": 240},
    },
    yollar: ["IV"],
  ),
  Ilac(
    isim: "Aisiklovir",
    dozlar: {
      "PO": {"doz": 20, "max": 400},
      "IV": {"doz": 60, "max": 400},
    },
    yollar: ["PO", "IV"],
  ),
  Ilac(
    isim: "Azitromisin",
    dozlar: {
      "PO": {"doz": 10, "max": 30},
    },
    yollar: ["PO"],
  ),
  Ilac(
    isim: "Budesonid",
    dozlar: {
      "PO": {"doz": 0.5, "max": 1},
    },
    yollar: ["PO"],
  ),
  Ilac(
    isim: "Diazepam",
    dozlar: {
      "IV": {"doz": 1, "max": 10},
    },
    yollar: ["IV"],
  ),
  Ilac(
    isim: "Ertapenem",
    dozlar: {
      "PO": {"doz": 15, "max": 30},
      "IV": {"doz": 10, "max": 30},
      "IM": {"doz": 15, "max": 30},
    },
    yollar: ["PO", "IV", "IM"],
  ),
  Ilac(
    isim: "Fenitoin",
    dozlar: {
      "PO": {"doz": 15, "max": 1000},
      "IV": {"doz": 15, "max": 1000},
    },
    yollar: ["PO", "IV"],
  ),
  Ilac(
    isim: "Fenobarbital",
    dozlar: {
      "PO": {"doz": 2, "max": 4},
      "IV": {"doz": 2, "max": 4},
    },
    yollar: ["PO", "IV"],
  ),
  Ilac(
    isim: "Teikoplanin",
    dozlar: {
      "IV": {"doz": 10, "max": 400},
    },
    yollar: ["IV"],
  ),
  Ilac(
    isim: "Salbutamol",
    dozlar: {
      "PO": {"doz": 0.15, "max": 12},
      "IV": {"doz": 5, "max": 12},
    },
    yollar: ["PO", "IV"],
  ),
  Ilac(
    isim: "Seftriakson",
    dozlar: {
      "PO": {"doz": 15, "max": 12},
      "IM": {"doz": 75, "max": 4000},
      "IV": {"doz": 75, "max": 4000},
    },
    yollar: ["PO", "IM", "IV"],
  ),
  Ilac(
    isim: "Sefotaksim",
    dozlar: {
      "IM": {"doz": 150, "max": 12000},
      "IV": {"doz": 150, "max": 12000},
    },
    yollar: ["IM", "IV"],
  ),
  Ilac(
    isim: "Sefazolin",
    dozlar: {
      "PO": {"doz": 100, "max": 6000},
      "IM": {"doz": 100, "max": 6000},
      "IV": {"doz": 100, "max": 6000},
    },
    yollar: ["PO", "IM", "IV"],
  ),
  Ilac(
    isim: "Sefuroksim",
    dozlar: {
      "PO": {"doz": 150, "max": 500},
      "IV": {"doz": 150, "max": 500},
    },
    yollar: ["PO", "IV"],
  ),
  Ilac(
    isim: "Piperasilin Tazobaktam",
    dozlar: {
      "PO": {"doz": 10, "max": 16000},
      "IV": {"doz": 300, "max": 16000},
    },
    yollar: ["PO", "IV"],
  ),
  Ilac(
    isim: "Paracetamol",
    dozlar: {
      "PO": {"doz": 15, "max": 90},
      "IV": {"doz": 15, "max": 90},
      "IM": {"doz": 15, "max": 90},
    },
    yollar: ["PO", "IV", "IM"],
  ),
];
