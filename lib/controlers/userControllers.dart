import '../models/userModels.dart';

class UserControllers {
  UserModel currentUser = UserModel(
    id: 1,
    name: "Keyza Nadine Kusuma Ramadani",
    email: "keyzanadine@gmail.com",
    imageUrl: "assets/gambar.jpg",
    username: "Keyza Nadine",
    phone: "081234567890",
    address: "Jl. Danau Ranau Raya No. 32, Malang",
    birthDate: "2008-09-21",
    role: "Owner",
    status: "active",
    bio: "Owner usaha buah sehat dan segar.",
    ownerOf: "Fruité", // ✅ ditambahkan
  );
}
