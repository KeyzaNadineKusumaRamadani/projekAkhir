import 'package:flutter/material.dart';
import 'package:databuah/models/fruitModels.dart';

class FruitControllers {
  // DATA DEFAULT
  final List<Fruitmodels> fruits = [
    Fruitmodels(
      id: 1,
      name: "Apel",
      description: "A sweet red fruit",
      price: 15000,
      imageUrl:
          "https://upload.wikimedia.org/wikipedia/commons/1/15/Red_Apple.jpg",
    ),
    Fruitmodels(
      id: 2,
      name: "Banana",
      description: "A long yellow fruit",
      price: 10000,
      imageUrl:
          "https://upload.wikimedia.org/wikipedia/commons/8/8a/Banana-Single.jpg",
    ),
    Fruitmodels(
      id: 3,
      name: "Orange",
      description: "A round orange fruit",
      price: 20000,
      imageUrl:
          "https://upload.wikimedia.org/wikipedia/commons/c/c4/Orange-Fruit-Pieces.jpg",
    ),
    Fruitmodels(
      id: 4,
      name: "Mango",
      description: "Fresh juicy mango",
      price: 20000,
      imageUrl:
          "https://upload.wikimedia.org/wikipedia/commons/9/90/Hapus_Mango.jpg",
    ),
    Fruitmodels(
      id: 5,
      name: "Strawberry",
      description: "A small red fruit with seeds on the outside",
      price: 30000,
      imageUrl:
          "https://upload.wikimedia.org/wikipedia/commons/2/29/PerfectStrawberry.jpg",
    ),
  ];

  // ✅ Ambil data buah (simulasi API)
  Future<List<Fruitmodels>> getFruits() async {
    await Future.delayed(const Duration(milliseconds: 300)); // simulasi loading
    return fruits;
  }

  // ✅ Tambah data buah
  void addFruit(Fruitmodels fruit) {
    fruits.add(fruit);
  }

  // ✅ Update data buah
  void updateFruit(Fruitmodels updatedFruit) {
    int index = fruits.indexWhere((f) => f.id == updatedFruit.id);
    if (index != -1) {
      fruits[index] = updatedFruit;
    }
  }

  // ✅ Delete data buah
  void deleteFruit(int id) {
    fruits.removeWhere((f) => f.id == id);
  }
}
