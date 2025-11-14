class UserModel {
  final int id;
  final String name;
  final String email;
  final String imageUrl;

  final String username;
  final String phone;
  final String address;
  final String birthDate;
  final String role;
  final String status;
  final String bio;

  final String ownerOf; // ✅ baru ditambahkan

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.username,
    required this.phone,
    required this.address,
    required this.birthDate,
    required this.role,
    required this.status,
    required this.bio,
    required this.ownerOf, // ✅ pastikan ditambahkan juga di constructor
  });
}
