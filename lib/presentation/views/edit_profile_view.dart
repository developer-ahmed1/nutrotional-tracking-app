import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nutrotional_tracking_app/core/models/user_model.dart';
import 'package:nutrotional_tracking_app/core/services/firestore_service.dart';

class EditProfileView extends StatefulWidget {
  final UserModel user;
  const EditProfileView({super.key, required this.user});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController weightController;

  File? selectedImage;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user.name);
    phoneController = TextEditingController(text: widget.user.phone);
    weightController = TextEditingController(text: widget.user.weight);
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  Future<void> _saveProfile() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    String base64Image = widget.user.profileImageBase64;

    if (selectedImage != null) {
      final bytes = await selectedImage!.readAsBytes();
      base64Image = base64Encode(bytes);
    }

    final updatedUser = UserModel(
      uid: uid,
      name: nameController.text,
      email: widget.user.email,
      phone: phoneController.text,
      weight: weightController.text,
      profileImageBase64: base64Image,
    );

    await FirestoreService().saveUserProfile(updatedUser);
    Navigator.pop(context, updatedUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profile")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: selectedImage != null
                    ? FileImage(selectedImage!)
                    : widget.user.profileImageBase64.isNotEmpty
                    ? MemoryImage(base64Decode(widget.user.profileImageBase64))
                    : const AssetImage('assets/default_user.png') as ImageProvider,
              ),
            ),
            const SizedBox(height: 20),
            TextField(controller: nameController, decoration: const InputDecoration(labelText: "Name")),
            TextField(controller: phoneController, decoration: const InputDecoration(labelText: "Phone")),
            TextField(controller: weightController, decoration: const InputDecoration(labelText: "Weight")),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _saveProfile, child: const Text("Save")),
          ],
        ),
      ),
    );
  }
}