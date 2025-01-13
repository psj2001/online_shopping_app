import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_shopping_app/provider/user%20Provider.dart';
import 'package:online_shopping_app/view/Screens/authentication%20screens/login%20sreen.dart';
import 'package:online_shopping_app/view/Screens/main%20screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  //Run the flutter app wrapped in a ProviderScope for managing state
  runApp(ProviderScope(child: const MyApp()));
}

// Root widget of the application a consumerWidget to consume state change
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

//Method to check the token and set the user data if available
  Future<void> _checkTokenAndSetUser(WidgetRef ref) async {
//Obtain an instance of sharedpreference for local data staroage
    SharedPreferences preferences = await SharedPreferences.getInstance();

//Retrive the authentication token and user data stored locally
    String? token = preferences.getString('auth_token');
    String? userJson = preferences.getString('user');

    //if both token and user data are available , update the user state
    if (token != null && userJson != null) {
      ref.read(userProvider.notifier).setUser(userJson);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Online shopping',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder(
          future: _checkTokenAndSetUser(ref),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
            return CircularProgressIndicator();
            }
         final user = ref.watch(userProvider);
         return user != null? Mainscreen():Loginsreen();
         }
          ),
    );
  }
}
