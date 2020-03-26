import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_permissions/simple_permissions.dart';
class app extends StatefulWidget {
  @override
  _appState createState() => new _appState();
}
class _appState extends State<app> {
  String _platformVersion;
  Permission permission;
  @override
  void initState() {
// TODO: implement initState
    super.initState();
    initplatform();
  }
//its just for getting the platform version
  initplatform() async {
    String platfrom;
    try {
      platfrom = await SimplePermissions.platformVersion;
    } on PlatformException {
      platfrom = "platform not found";
    }
//if object is removed from the tree.
    if (!mounted) return;
//otherwise set the platform to our _platformversion global variable
    setState(() => _platformVersion = platfrom);
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("permissions"),
        ),
        body: new Center(
            child: new Column(
              children: <Widget>[
                new Text("platform version is $_platformVersion\n"),
                new Divider(
                  height: 10.0,
                ),
//it allows user to select one permission from the drop down button
                new DropdownButton(
                  items: _getDropDownItems(),
                  value: permission,
                  onChanged: onDropDownChanged,
                ),
                new Divider(
                  height: 10.0,
                ),
//now just simple  button widgets , nothing fascinating here,
                new RaisedButton(
                  onPressed: checkpermission,
                  color: Colors.greenAccent,
                  child: new Text("check permision"),
                ),
                new Divider(
                  height: 10.0,
                ),
                new RaisedButton(
                  onPressed: requestPermission,
                  color: Colors.orange,
                  child: new Text("request the permission"),
                ),
                new Divider(
                  height: 10.0,
                ),
                new RaisedButton(
                  onPressed: getstatus,
                  color: Colors.blueAccent,
                  child: new Text("get Status"),
                ),
                new Divider(
                  height: 10.0,
                ),
                new RaisedButton(
//here we'll open settings using the library
                  onPressed: SimplePermissions.openSettings,
                  color: Colors.redAccent,
                  child: new Text("open setting "),
                ),
              ],
            )),
      ),
    );
  }
//on selection of a permission , assign the value to our global permission variable
  void onDropDownChanged(Permission value) {
    setState(()=> this.permission =value);
    print(permission);
  }
  void checkpermission() async{
    bool result = await SimplePermissions.checkPermission(permission);
    print("permission is "+ result.toString());
  }
  void requestPermission() async{
    var result = await SimplePermissions.requestPermission(permission);
    print("request :"+ result.toString());
  }
  void getstatus() async{
    final result = await
    SimplePermissions.getPermissionStatus(permission);
    print("permission status is :"+result.toString());
  }
//its just give the list of available permissions.
  List<DropdownMenuItem<Permission>> _getDropDownItems() {
    List<DropdownMenuItem<Permission>> items = new List();
    Permission.values.forEach((permission) {
      var item = new DropdownMenuItem(
          child: new Text(getPermissionString(permission)), value: permission);
      items.add(item);
    });
    return items;
  }
}