import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nutrotional_tracking_app/core/theming/app_colors.dart';
import 'package:nutrotional_tracking_app/presentation/views/edit_profile_view.dart';
import 'package:nutrotional_tracking_app/presentation/cubits/cubit/user_profile_cubit.dart';
import 'package:nutrotional_tracking_app/core/services/firestore_service.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserProfileCubit(FirestoreService())..loadUserProfile(),
      child: const ProfileContent(),
    );
  }
}

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              final state = context.read<UserProfileCubit>().state;
              if (state is UserProfileLoaded) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => EditProfileView(user: state.user),
                  ),
                ).then((updatedUser) {
                  if (updatedUser != null) {
                    context.read<UserProfileCubit>().loadUserProfile();
                  }
                });
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
        ],
      ),
      backgroundColor: AppColors.backgroundColor,
      body: BlocBuilder<UserProfileCubit, UserProfileState>(
        builder: (context, state) {
          if (state is UserProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserProfileLoaded) {
            final user = state.user;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: user.profileImageBase64.isNotEmpty
                        ? MemoryImage(base64Decode(user.profileImageBase64))
                        : const AssetImage('assets/default_user.png') as ImageProvider,
                  ),
                  const SizedBox(height: 20),
                  Text("Name: ${user.name}", style: const TextStyle(fontSize: 18)),
                  Text("Email: ${user.email}", style: const TextStyle(fontSize: 16)),
                  Text("Phone: ${user.phone}", style: const TextStyle(fontSize: 16)),
                  Text("Weight: ${user.weight} kg", style: const TextStyle(fontSize: 16)),
                ],
              ),
            );
          } else if (state is UserProfileError) {
            return Center(child: Text("Error: ${state.message}"));
          } else {
            return const Center(child: Text("No profile data"));
          }
        },
      ),
    );
  }
}