import 'dart:async';
import 'dart:convert';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_html/flutter_html.dart';

// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class Album {
  final int id;
  final String title;
  final String desc;
  final String image;

  const Album({
    required this.id,
    required this.desc,
    required this.image,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'desc': String desc,
        'image': String image,
        'id': int id,
        'title': String title,
      } =>
        Album(
          id: id,
          desc: desc,
          image: image,
          title: title,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}

void main() => runApp(const App());

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _MyAppState();
}

class _MyAppState extends State<App> {
  late Future<Album> futureAlbum1;

  List<Album> datalist = [];

  Future<void> fetchAlbum() async {
    final response =
        await http.get(Uri.parse('http://192.168.31.97:8000/api/post'));

    if (response.statusCode == 200) {
      List<dynamic> jisodata = json.decode(response.body);
      setState(() {
        datalist = jisodata.map((data) => Album.fromJson(data)).toList();
      });
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // datalist = Album.fromJson(jsonDecode(response.body))
      //     as List;
      // return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    fetchAlbum();
    super.initState();
  }

  Map<String, dynamic>? maprespose;

  // Future test() async {
  //   final response =
  //       await http.get(Uri.parse('http://192.168.31.97:8000/api/post'));

  //   if (response.statusCode == 200) {
  //     setState((

  //         // maprespose = ;
  //         ) {});
  //     print(response.body);
  //     datalist =
  //         Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>)
  //             as List;
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // then throw an exception.
  //     throw Exception('Failed to load album');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: datalist.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(datalist[index].desc.toString()) ;
            },
          ),
          // child: FutureBuilder<Album>(
          //   future: futureAlbum1,
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       var htmldata = '${snapshot.data!.desc}';
          //       print(htmldata);
          //       return ListView.builder(
          //         itemCount: 5,
          //         itemBuilder: (BuildContext context, int index) {
          //           return Center(child: Text('data'));
          //           // return Html(data: '''${snapshot.data!.desc}''');
          //         },
          //       );

          //       // return Text('${snapshot.data!.desc}');
          //       // return  Center(
          //       //   child:Image.network("http://192.168.31.97:8000/images//${snapshot.data!.image}")
          //       // );
          //     } else if (snapshot.hasError) {
          //       return Text('${snapshot.error}');
          //     }

          //     // By default, show a loading spinner.
          //     return const CircularProgressIndicator();
          //   },
          // ),
        ),
      ),
    );
  }
}
