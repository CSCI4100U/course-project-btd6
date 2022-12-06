import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ColorIndex.dart';


class ChangeColorPage extends StatefulWidget {
  const ChangeColorPage({super.key});

  @override
  State<ChangeColorPage> createState() => _ChangeColorPage();
}

class _ChangeColorPage extends State<ChangeColorPage> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          title: const Text("Chose Color")
      ),
      body: Container(
        padding: const EdgeInsets.all(50),
        child: ListView.separated(
            itemBuilder: (context, index){
              return Container(
                height: 50,
                color: color(index),
                child: TextButton(
                  onPressed: (){
                    Navigator.pop(context, color(index));
                  },
                  child: Icon(Icons.color_lens_rounded, color: Colors.white,),
                  ),
                );

            },
            separatorBuilder: (context,index){
              return const Divider();
            },
            itemCount: 8
        ),
      ),
    );
  }
}
