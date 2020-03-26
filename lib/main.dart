import 'package:flutter/material.dart';
import 'package:know_the_car/ui/home.dart';
import 'package:know_the_car/util/permissions.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'لمن هذه؟';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData(
        fontFamily: 'Tajawal',
        primaryColor: Colors.brown[500],
        cursorColor: Colors.brown[400],
      ),
      onGenerateRoute: routes,
    );
  }

  Route routes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) {
            return HomePage(_title);
          },
        );
    }
  }
}

// Database Project //

//import 'package:flutter/material.dart';
//import 'package:know_the_car/util/database_helper.dart';
//
//import 'model/user.dart';
//
//
//List _users;
//
//void main() async {
//  var db = new DatabaseHelper();
//
//  //Add user
//  await db.saveUser(new User("Genyy", "musician"));
//
//  int count = await db.getCount();
//  print("Count: $count");
//
//  //Retrieving a user
//  // User ana = await db.getUser(1);
////  User anaUpdated = User.fromMap({
////    "username": "UpdatedAna",
////    "password" : "updatedPassword",
////    "id"       : 1
////  });
////
////
////  //Update
////  await
////  db.updateUser(anaUpdated);
//
//
//  //Delete a User
//  // int userDeleted = await db.deleteUser(2);
//
//
//  // print("Delete User:  $userDeleted");
//
//  //Get all users;
//  _users = await db.getAllUsers();
//  for (int i = 0; i < _users.length; i++) {
//    User user = User.map(_users[i]);
//
//    print("Username: ${user.username }, User Id: ${user.id}");
//  }
//
//
//  runApp(new MaterialApp(
//    title: "Database",
//    home: new Home(),
//  ));
//}
//
//class Home extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text("Database"),
//        centerTitle: true,
//        backgroundColor: Colors.lightGreen,
//      ),
//      body: new ListView.builder(
//          itemCount: _users.length,
//          itemBuilder: (_, int position) {
//            return new Card(
//              color: Colors.white,
//              elevation: 2.0,
//              child: new ListTile(
//                leading: new CircleAvatar(
//                  child:  Text("${User.fromMap(_users[position]).username.substring(0, 1)}"),
//                ),
//                title: new Text("User: ${User.fromMap(_users[position]).username}"),
//                subtitle: new Text("Id: ${User.fromMap(_users[position]).id}"),
//
//                onTap: () => debugPrint("${User.fromMap(_users[position]).password}"),
//              ),
//            );
//
//
//          }),
//    );
//  }
//}
