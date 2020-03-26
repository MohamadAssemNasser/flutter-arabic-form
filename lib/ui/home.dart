import 'package:flutter/material.dart';
import 'package:simple_permissions/simple_permissions.dart';

class HomePage extends StatefulWidget {
  String _title;

  HomePage(this._title);

  @override
  _HomePageState createState() => _HomePageState();
}

TextStyle titleStyle() {
  return TextStyle(
    fontSize: 22,
  );
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = new TextEditingController();
  //BuildContext _scaffoldcontext;

  Future<void> requestPermissions() async {
    if(await SimplePermissions.checkPermission(Permission.WriteExternalStorage) == false){
      await SimplePermissions.requestPermission(Permission.WriteExternalStorage);
    }
//    final String path = "/database/cars.db";
//    var database = File(path);
//    bool fileExists = await database.exists();
//    fileExists ? debugPrint("exists!") : debugPrint("doesn't exist!");
  }

  @override
  void initState() {
    requestPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add_circle), onPressed: () => Navigator.pushNamed(context, '/filePicker'))
        ],
      ),
      body: Builder(
        builder: (BuildContext context) {
          return ListView(
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.right,
                      controller: nameController,
                      enabled: true,
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                      ),
                    ),
                  ),
                  Text(
                    "الاسم: ",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: titleStyle(),
                  ),
                ],
              ),
              MaterialButton(
                onPressed: () {
                  if (nameController.text != '')
                    Navigator.pushNamed(context, '/search');
                  else
                    Scaffold.of(context).showSnackBar(new SnackBar(
                      content: Text('أدخل معلومة على الأقل!', textDirection: TextDirection.rtl,),
                      duration: Duration(seconds: 1),
                      backgroundColor: Colors.brown[900],
                    ));
                },
                child: Text(
                  'بحث',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                elevation: 4.0,
                color: Colors.brown[500],
              ),
            ],
          );
        }
      ),
    );
  }
  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    nameController.dispose();
    super.dispose();
  }
}
