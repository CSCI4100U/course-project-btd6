import 'package:flutter/material.dart';
import 'package:group_project/settings_interface.dart';
import '../../../account.dart';
import 'package:flutter_i18n/flutter_i18n.dart';


import 'loginPage.dart';

class accountPage extends StatefulWidget {
  const accountPage({Key? key}) : super(key: key);

  @override
  State<accountPage> createState() => _accountPageState();
}

class _accountPageState extends State<accountPage> {
  var _username;
  var _email;
  var _password;
  final local = SettingInterface();

  Future addAcc(Acc ac) async{
    local.createAcc(ac);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(FlutterI18n.translate(context, "account.title")),),
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
              child: Column(children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(hintText: FlutterI18n.translate(context, "account.nameHint")),
                  //store what they as name in personAccount
                  onChanged: (value){
                    _username = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: FlutterI18n.translate(context, "account.emailHint")),
                  //store what they as email in personAccount
                  onChanged: (value){
                    _email = value;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: FlutterI18n.translate(context, "account.passwordHint")),
                  //store what they as password in personAccount
                  onChanged: (value){
                    _password = value;
                  },
                ),
                FloatingActionButton(
                  onPressed: (){
                    //make new person account and add to sqlite
                    //You might not need to make the new person.
                    //You could just set each field and create the
                    //person object in another spot with sqLite
                    Acc temp = Acc(username: _username, email: _email, password: _password);
                    addAcc(temp);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LoginPage()
                    ));
                  },
                  child: Text(FlutterI18n.translate(context, "account.done")),
                ),
              ])
          )
      ),
    );
  }
}