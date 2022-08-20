// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Welcome"),
//         centerTitle: true,
//       ),
//       body: Center(
//           child: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(
//               height: 150,
//               child: Image.asset("assets/download.jpg", fit: BoxFit.contain),
//             ),
//             const Text(
//               "welcome",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const Text("Name"),
//             const Text("email"),
//             ActionChip(label: const Text("Logout"), onPressed: () {})
//           ],
//         ),
//       )),
//     );
//   }
// }

// ignore_for_file: library_private_types_in_public_api, unnecessary_this, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firelogin/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 150,
                child: Image.asset("assets/download.jpg", fit: BoxFit.contain),
              ),
              Text(
                "Welcome ${loggedInUser.Name}",
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: ListTile(
                    title: Text(
                        " Phone :${loggedInUser.phone}\n\n DOB :${loggedInUser.date}\n \nemail :${loggedInUser.email}\n",
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24)),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ActionChip(
                label: const Text(
                  "Logout",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                onPressed: () {
                  logout(context);
                },
                backgroundColor: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
