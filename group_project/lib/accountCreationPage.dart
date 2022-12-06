import 'package:flutter/material.dart';
import '../../../account.dart';

class accountPage extends StatefulWidget {
  const accountPage({Key? key}) : super(key: key);

  @override
  State<accountPage> createState() => _accountPageState();
}

class _accountPageState extends State<accountPage> {
  var username;
  var email;
  var password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Account'),),
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
              child: Column(children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(hintText: 'Name'),
                  //store what they as name in personAccount
                  onChanged: (value){
                    username = value;
                    username = username;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Email'),
                  //store what they as email in personAccount
                  onChanged: (value){
                    email = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Password'),
                  //store what they as password in personAccount
                  onChanged: (value){
                    password = value;
                  },
                ),
                FloatingActionButton(
                  onPressed: (){
                    //make new person account and add to sqlite
                    //You might not need to make the new person.
                    //You could just set each field and create the
                    //person object in another spot with sqLite
                    Acc(username: username, email: email, password: password);
                  },
                  child: Text('Done'),
                ),
              ])
          )
      ),
    );
  }
}