import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Model/user.dart';

class Userprovider extends StateNotifier<User?> {
// Constructor initializing with default user object
// purpose: Manage the state of the user object allowing updates
  Userprovider()
      : super(User(
            id: '',
            fullName: '',
            email: '',
            state: '',
            city: '',
            locality: '',
            password: '',
            token: ''));

  // Getter method to extract value from an object
  User? get user => state;

  // method to set user from Json
  // purpose : updates he user state base on json String respresentation of user object

  void setUser(String userJson) {
    state = User.fromJson(userJson);
  }
// Method to cleat user State

void signOut() {
  state = null;
  log('User signed out, state is now: $state');
}

 
}
 // Make the data accisible within the application
  final userProvider = StateNotifierProvider<Userprovider, User?>(
    (ref) => Userprovider()
  );