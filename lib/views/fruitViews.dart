import 'package:flutter/material.dart';
import 'package:databuah/models/fruitModels.dart';
import 'package:databuah/controlers/fruitControlers.dart';

class Fruitviews extends StatefulWidget {
  const Fruitviews({super.key});

  @override
  State<Fruitviews> createState() => _FruitviewsState();
}

class _FruitviewsState extends State<Fruitviews> {
  final FruitControllers _fruitController = FruitControllers();
  List<Fruitmodels>? fruits;

  TextEditingController nameC = TextEditingController();
  TextEditingController descC = TextEditingController();
  TextEditingController priceC = TextEditingController();
  TextEditingController imageC = TextEditingController();
  int? fruitID;

  @override
  void initState() {
    super.initState();
    loadFruits();
  }

  void loadFruits() async {
    fruits = await _fruitController.getFruits();
    setState(() {});
  }

  Color getCardColor(int index) {
    List<Color> colors = [
      Color(0xFFFFE3E3),
      Color(0xFFECE3FF),
      Color(0xFFFFF5CC),
      Color(0xFFFFDAC3),
      Color(0xFFE3FFEA),
      Color(0xFFD4F7FF),
    ];
    return colors[index % colors.length];
  }

  // ==============================
  // DETAIL + PERHITUNGAN + UPDATE/DELETE
  // ==============================
  void showFruitDetail(BuildContext context, Fruitmodels fruit, int index) {
    int quantity = 1;

    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateSB) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: const BoxDecoration(
                color: Color(0xFFFFF5CC),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  // IMAGE
                  SizedBox(
                    height: 200,
                    child: Image.network(
                      fruit.imageUrl,
                      fit: BoxFit.contain,
                    ),
                  ),

                  // CONTENT
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // HEADER + POPUP MENU
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                fruit.name,
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              // ✅ POPUP UPDATE & DELETE
                              PopupMenuButton(
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    value: "update",
                                    child: Row(
                                      children: const [
                                        Icon(Icons.edit, color: Colors.blue),
                                        SizedBox(width: 8),
                                        Text("Update"),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: "delete",
                                    child: Row(
                                      children: const [
                                        Icon(Icons.delete, color: Colors.red),
                                        SizedBox(width: 8),
                                        Text("Delete"),
                                      ],
                                    ),
                                  ),
                                ],
                                onSelected: (value) {
                                  if (value == "update") {
                                    Navigator.pop(context);
                                    openUpdateForm(fruit);
                                  } else {
                                    Navigator.pop(context);
                                    _fruitController.deleteFruit(fruit.id);
                                    loadFruits();
                                  }
                                },
                              ),
                            ],
                          ),

                          const SizedBox(height: 12),

                          // QTY SELECTOR
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (quantity > 1) {
                                    setStateSB(() => quantity--);
                                  }
                                },
                                icon: Icon(Icons.remove_circle_outline, size: 28),
                              ),
                              Text(
                                quantity.toString(),
                                style: const TextStyle(fontSize: 22),
                              ),
                              IconButton(
                                onPressed: () {
                                  setStateSB(() => quantity++);
                                },
                                icon: Icon(Icons.add_circle_outline, size: 28),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          // TOTAL PRICE
                          Text(
                            "Total: IDR ${(fruit.price * quantity).toStringAsFixed(0)}",
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 16),

                          const Text(
                            "Description:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),

                          Text(
                            fruit.description,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),

                          const Spacer(),

                          GestureDetector(
                            onTap: () {
                              double total = fruit.price * quantity;

                              Navigator.pop(context);

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Ditambahkan $quantity ${fruit.name} | Total: IDR ${total.toStringAsFixed(0)}",
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  duration: const Duration(seconds: 3),
                                ),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              height: 55,
                              decoration: BoxDecoration(
                                color: Colors.amber.shade400,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Center(
                                child: Text(
                                  "Add $quantity to cart",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // ✅ FORM UPDATE
  void openUpdateForm(Fruitmodels fruit) {
    nameC.text = fruit.name;
    descC.text = fruit.description;
    priceC.text = fruit.price.toString();
    imageC.text = fruit.imageUrl;
    fruitID = fruit.id;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Update Fruit"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(controller: nameC, decoration: InputDecoration(labelText: "Name")),
                TextField(controller: descC, decoration: InputDecoration(labelText: "Description")),
                TextField(controller: priceC, decoration: InputDecoration(labelText: "Price")),
                TextField(controller: imageC, decoration: InputDecoration(labelText: "Image URL")),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")),
            ElevatedButton(
              onPressed: () {
                Fruitmodels updated = Fruitmodels(
                  id: fruitID!,
                  name: nameC.text,
                  description: descC.text,
                  price: double.parse(priceC.text),
                  imageUrl: imageC.text,
                );

                _fruitController.updateFruit(updated);
                loadFruits();
                Navigator.pop(context);
              },
              child: Text("Update"),
            ),
          ],
        );
      },
    );
  }

  // ✅ FORM TAMBAH DATA
  void openAddForm() {
    nameC.clear();
    descC.clear();
    priceC.clear();
    imageC.clear();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Tambah Buah Baru"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameC,
                  decoration: const InputDecoration(labelText: "Name"),
                ),
                TextField(
                  controller: descC,
                  decoration: const InputDecoration(labelText: "Description"),
                ),
                TextField(
                  controller: priceC,
                  decoration: const InputDecoration(labelText: "Price"),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: imageC,
                  decoration: const InputDecoration(labelText: "Image URL"),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameC.text.isEmpty ||
                    descC.text.isEmpty ||
                    priceC.text.isEmpty ||
                    imageC.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Semua kolom harus diisi!")),
                  );
                  return;
                }

                final newFruit = Fruitmodels(
                  id: _fruitController.fruits.length + 1,
                  name: nameC.text,
                  description: descC.text,
                  price: double.tryParse(priceC.text) ?? 0,
                  imageUrl: imageC.text,
                );

                _fruitController.addFruit(newFruit);
                loadFruits();
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${newFruit.name} berhasil ditambahkan")),
                );
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fruit Store"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline_sharp, color: Colors.brown),
            onPressed: openAddForm,
          ),
        ],
      ),
      body: fruits == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.72,
                ),
                itemCount: fruits!.length,
                itemBuilder: (context, index) {
                  Fruitmodels item = fruits![index];

                  return GestureDetector(
                    onTap: () {
                      showFruitDetail(context, item, index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: getCardColor(index),
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: Offset(2, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                item.imageUrl,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  item.description,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "IDR ${item.price.toStringAsFixed(0)}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
