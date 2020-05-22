import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(new MaterialApp(
    home: new HomePage(),
    theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Superheroes",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.lime,
        ),
        body: new Container(
          child: new Center(
              child: new FutureBuilder(
                  future: DefaultAssetBundle.of(context)
                      .loadString('json_assets/json_.json'),
                  builder: (context, snapshot) {
                    var jsonData = json.decode(snapshot.data.toString());
                    return new ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return new Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                height: 160,
                                width: 160,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            jsonData[index]["image"]))),
                              ),
                              new Text(""),
                              new Text("Super héroe: " +
                                  jsonData[index]["superheroe"]),
                              new Text(""),
                              new Text("Nombre: " +
                                  jsonData[index]["identidad"]),
                              new Text(""),
                              new Text("Edad: " + jsonData[index]["edad"]),
                              new Text(""),
                              new Text("Altura: " + jsonData[index]["altura"]),
                              new Text(""),
                              new Text("Género: " + jsonData[index]["genero"]),
                              new Text(""),
                              new Text("Descripcion: " +
                                  jsonData[index]["descripcion"]),
                              new Text(""),
                            ],
                          ),
                        );
                      },
                      itemCount: jsonData == null ? 0 : jsonData.length,
                    );
                  })),
        ));
  }
}