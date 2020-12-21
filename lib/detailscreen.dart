import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:midterm/bookdetail.dart';

void main() => runApp(DetailScreen());

class DetailScreen extends StatefulWidget {
  final BookDetail book;
  const DetailScreen({Key key, this.book}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  double screenHeight, screenWidth;
  List bookList;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('DETAILS OF BOOK'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            SizedBox(height: 80),
            Container(
              height: screenHeight / 3,
              width: screenWidth / 1.1,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl:
                    "http://slumberjer.com/bookdepo/bookcover/${widget.book.cover}.jpg",
                placeholder: (context, url) => new CircularProgressIndicator(),
                errorWidget: (context, url, error) => new Icon(Icons.broken_image),
              ),
            ),
            SizedBox(height: 6),
            Container(
              width: screenWidth / 1.1,
              //height: screenHeight / 2,
              child: Card(
                elevation: 6,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(children: <Widget>[
                    Table(defaultColumnWidth: FlexColumnWidth(1.0), children: [
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              alignment: Alignment.centerLeft,
                              height: 30,
                              child: Text("BOOKID",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ))),
                        ),
                        TableCell(
                            child: Container(
                          height: 65,
                          child: Container(
                              alignment: Alignment.centerLeft,
                              height: 30,
                              child: Text(
                                ":  " + widget.book.bookid,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )),
                        )),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              alignment: Alignment.centerLeft,
                              height: 30,
                              child: Text("BOOKTITLE",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ))),
                        ),
                        TableCell(
                            child: Container(
                          height: 30,
                          child: Container(
                              alignment: Alignment.centerLeft,
                              height: 30,
                              child: Text(
                                ":  " + widget.book.booktitle,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )),
                        )),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              alignment: Alignment.centerLeft,
                              height: 30,
                              child: Text("AUTHOR",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ))),
                        ),
                        TableCell(
                            child: Container(
                          height: 30,
                          child: Container(
                              alignment: Alignment.centerLeft,
                              height: 30,
                              child: Text(
                                ":  " + widget.book.author,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )),
                        )),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              alignment: Alignment.centerLeft,
                              height: 30,
                              child: Text("PRICE",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ))),
                        ),
                        TableCell(
                            child: Container(
                          height: 30,
                          child: Container(
                              alignment: Alignment.centerLeft,
                              height: 30,
                              child: Text(
                                ":  " + widget.book.price,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )),
                        )),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              alignment: Alignment.centerLeft,
                              height: 30,
                              child: Text("DESCRIPTION",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ))),
                        ),
                        TableCell(
                            child: Container(
                          height: 30,
                          child: Container(
                              alignment: Alignment.centerLeft,
                              height: 30,
                              child: Text(
                                ":  " + widget.book.description,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )),
                        )),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              alignment: Alignment.centerLeft,
                              height: 30,
                              child: Text("RATING",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ))),
                        ),
                        TableCell(
                            child: Container(
                          height: 30,
                          child: Container(
                              alignment: Alignment.centerLeft,
                              height: 30,
                              child: Text(
                                ":  " + widget.book.rating,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )),
                        )),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              alignment: Alignment.centerLeft,
                              height: 30,
                              child: Text("PUBLISHER",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ))),
                        ),
                        TableCell(
                            child: Container(
                          height: 30,
                          child: Container(
                              alignment: Alignment.centerLeft,
                              height: 30,
                              child: Text(
                                ":  " + widget.book.publisher,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )),
                        )),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              alignment: Alignment.centerLeft,
                              height: 30,
                              child: Text("ISBN",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ))),
                        ),
                        TableCell(
                            child: Container(
                          height: 30,
                          child: Container(
                              alignment: Alignment.centerLeft,
                              height: 30,
                              child: Text(
                                ":  " + widget.book.isbn,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )),
                        )),
                      ]),
                      
                    ]),
                  ]),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
