import 'package:flutter/material.dart';
import '../controlers/userControllers.dart';
import '../models/userModels.dart';

class Accountviews extends StatelessWidget {
  const Accountviews({super.key});

  @override
  Widget build(BuildContext context) {
    final UserControllers userController = UserControllers();
    final UserModel user = userController.currentUser;

    final bool isAsset = !user.imageUrl.startsWith('http');

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 52, 3),
        centerTitle: true,
        title: const Text(
          "👤 Akun Saya",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 244, 246, 244),
            letterSpacing: 1.2,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Foto profil
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: isAsset
                  ? Image.asset(
                      user.imageUrl,
                      width: 140,
                      height: 140,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      user.imageUrl,
                      width: 140,
                      height: 140,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 140,
                          height: 140,
                          color: Colors.grey.shade300,
                          child: const Icon(Icons.person,
                              size: 80, color: Colors.grey),
                        );
                      },
                    ),
            ),

            const SizedBox(height: 20),

            Text(
              user.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B5E20),
              ),
            ),

            const SizedBox(height: 6),

            Text(
              user.email,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 25),

            // CARD DATA PROFIL
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 231, 246, 228),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildInfoTile("Username", user.username),
                  _buildInfoTile("Nomor HP", user.phone),
                  _buildInfoTile("Alamat", user.address),
                  _buildInfoTile("Tanggal Lahir", user.birthDate),
                  _buildInfoTile("Role", user.role),
                  _buildInfoTile("Status", user.status),
                  _buildInfoTile("Pemilik Usaha", user.ownerOf),
                  _buildInfoTile("Bio", user.bio),
                ],
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Fitur edit profil coming soon!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade700,
                padding: const EdgeInsets.symmetric(
                    horizontal: 28, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              icon: const Icon(Icons.edit, color: Colors.white),
              label: const Text(
                "Edit Profil",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget helper untuk menampilkan informasi
  Widget _buildInfoTile(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.green,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
        const Divider(height: 20, thickness: 1),
      ],
    );
  }
}
