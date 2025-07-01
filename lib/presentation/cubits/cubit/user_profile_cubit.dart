import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nutrotional_tracking_app/core/models/user_model.dart';
import 'package:nutrotional_tracking_app/core/services/firestore_service.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  final FirestoreService firestoreService;

  UserProfileCubit(this.firestoreService) : super(UserProfileInitial());

  Future<void> loadUserProfile() async {
    emit(UserProfileLoading());

    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      emit(UserProfileError("User not logged in"));
      return;
    }

    final user = await firestoreService.getUserProfile(uid);
    if (user != null) {
      emit(UserProfileLoaded(user));
    } else {
      emit(UserProfileError("Profile not found"));
    }
  }
}
