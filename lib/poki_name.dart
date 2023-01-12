// import 'dart:ffi';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// void main() => runApp(new MaterialApp(
//   home: new ,
// ))

class PokiName extends StatefulWidget {
  const PokiName({super.key});

  @override
  State<PokiName> createState() => _PokiNameState();
}

class _PokiNameState extends State<PokiName> {

  final String url = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  late List data;
  
  @override
  void initState(){
    super.initState();
    this.getJsonData();

  }
    Future<String> getJsonData() async{
      var response = await http.get(
       Uri.encodeFull(url) as Uri,
      //  headers: {"Accept": "application/json"}
      );
      print("response.body");
      print(response.body);

      setState(() {
        var convertDataToJson = json.decode(response.body);
        data = convertDataToJson['pokemon'];
      });
      return "Success";
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("Poki Name")),
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(data[index]['id']),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
