import 'package:flutter/material.dart';
import '../models/userModels.dart';

class AccountWidget {
  Widget profileCard(UserModel user) {
    // Cek apakah image adalah asset atau URL
    final bool isAssetImage = !user.imageUrl.startsWith('http');

    return Center(
      child: Card(
        elevation: 6,
        margin: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Foto profil
              CircleAvatar(
                radius: 60,
                backgroundImage: isAssetImage
                    ? AssetImage(user.imageUrl) as ImageProvider
                    : NetworkImage(user.imageUrl),
                onBackgroundImageError: (error, stackTrace) {},
              ),

              const SizedBox(height: 16),

              // Nama
              Text(
                user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Color(0xFF1B5E20),
                ),
              ),

              const SizedBox(height: 6),

              // Email
              Text(
                user.email,
                style: const TextStyle(color: Colors.black54, fontSize: 16),
              ),

              const SizedBox(height: 20),

              // Informasi tambahan
              _buildInfoRow("Username", user.username),
              _buildInfoRow("Nomor HP", user.phone),
              _buildInfoRow("Alamat", user.address),
              _buildInfoRow("Tanggal Lahir", user.birthDate),
              _buildInfoRow("Role", user.role),
              _buildInfoRow("Status", user.status),
              _buildInfoRow("Pemilik Brand", user.ownerOf),
              _buildInfoRow("Bio", user.bio),

              const SizedBox(height: 20),

              // Tombol Logout
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // TODO: Aksi logout
                },
                icon: const Icon(Icons.logout, color: Colors.white),
                label: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget helper untuk baris info (label + value)
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              "$label:",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
                fontSize: 15,
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Text(
              value,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
