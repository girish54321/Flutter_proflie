import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool selected = true;

  Widget _items() {
    return Container(
      margin: EdgeInsets.only(left: 10),
      width: 70,
      height: 40,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Image.network(
        "https://images.pexels.com/photos/247478/pexels-photo-247478.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        fit: BoxFit.fill,
      ),
    );
  }

  void changeSet() {
    if (this.selected == true) {
      setState(() {
        selected = false;
      });
    } else {
      setState(() {
        selected = true;
      });
    }
  }

  Widget moreinfo() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Photos",
            style: TextStyle(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          Container(
            height: 70,
            margin: EdgeInsets.symmetric(vertical: 15),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _items(),
                _items(),
                _items(),
                _items(),
                _items(),
                _items(),
                _items(),
                _items(),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              changeSet();
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),
                  ]),
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              height: 50,
              child: Center(
                child: Text(
                  "Follow",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget knowMoreButton() {
    return GestureDetector(
      onTap: () {
        changeSet();
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
              ),
            ]),
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        height: 50,
        child: Center(
          child: Text(
            "Know More",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: GestureDetector(
              onTap: () {
               // changeSet();
              },
              child: Image.network(
                'https://images.unsplash.com/photo-1552642986-ccb41e7059e7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
                fit: BoxFit.cover,
              ),
            )),
        Container(
          margin: EdgeInsets.only(top: 15),
          child: ListTile(
              leading: Icon(
                Icons.clear,
                color: Colors.white,
              ),
              title: Text(
                "Girish Parate",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              trailing: Icon(
                Icons.more_vert,
                color: Colors.white,
              )),
        ),
        Align(
          alignment: FractionalOffset.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.bounceOut,
                height: selected ? 170.0 : 300,
                width: MediaQuery.of(context).size.width - 50,
                margin: EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),
                      ]),
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Girish Parate",
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.work,
                              size: 18,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Mobile app devloper",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.mail,
                              size: 18,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "mymail@outlook.com",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.blue),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        selected ? knowMoreButton() : moreinfo()
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
