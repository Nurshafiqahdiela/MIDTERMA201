import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:midterm/bookdetail.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:midterm/detailscreen.dart';

void main() => runApp(MainScreen());

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

List bookcover;

class _MainScreenState extends State<MainScreen> {
  double screenHeight, screenWidth;
  String titlecenter = "Loading..";

  @override
  void initState() {
    super.initState();
    _loadBook();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('LIST OF BOOKS'),
      ),
      body: Column(
        children: [
          bookcover == null
              ? Flexible(
                  child: Container(
                      child: Center(
                          child: Text(
                  titlecenter,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ))))
              : Flexible(
                  child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: (screenWidth / screenHeight) / 0.90,
                  children: List.generate(bookcover.length, (index) {
                    return Padding(
                        padding: EdgeInsets.all(5),
                        child: Card(
                          child: InkWell(
                            onTap: () => _loadBookDetail(index),
                            child: Column(
                              children: [
                                Container(
                                    height: screenHeight / 4.0,
                                    width: screenWidth / 3.0,
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "http://slumberjer.com/bookdepo/bookcover/${bookcover[index]['cover']}.jpg",
                                      fit: BoxFit.contain,
                                      placeholder: (context, url) =>
                                          new CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          new Icon(
                                        Icons.broken_image,
                                        size: screenWidth / 2,
                                      ),
                                    )),
                                SizedBox(height: 2.5),
                                Text(
                                  bookcover[index]['booktitle'],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '[' + bookcover[index]['author'] + ']',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'RM ' + bookcover[index]['price'],
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Rating: ' + bookcover[index]['rating'],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ));
                  }),
                ))
        ],
      ),
    );
  }

  void _loadBook() {
    http.post("http://slumberjer.com/bookdepo/php/load_books.php",
        body: {}).then((res) {
      print(res.body);
      if (res.body == "nodata") {
        bookcover = null;
      } else {
        setState(() {
          var jsondata = json.decode(res.body);
          bookcover = jsondata["books"];
        });
      }
    }).catchError((err) {
      print(err);
    });
  }

  _loadBookDetail(int index) {
    print(bookcover[index]['booktitle']);
    BookDetail bookDetails = new BookDetail(
      bookid: bookcover[index]['bookid'],
      booktitle: bookcover[index]['booktitle'],
      author: bookcover[index]['author'],
      price: bookcover[index]['price'],
      description: bookcover[index]['description'],
      rating: bookcover[index]['rating'],
      publisher: bookcover[index]['publisher'],
      isbn: bookcover[index]['isbn'],
      cover: bookcover[index]['cover'],
    );

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                DetailScreen(book: bookDetails)));
  }
}
