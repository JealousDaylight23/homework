import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            "Weather Forecast",
            style: TextStyle(color: Colors.white, fontSize: 23),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: _BodyBuilder(),
      ),
    );
  }
}

class _BodyBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            _TextField(),
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: _CityDetail(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 35),
              child: _TemperatureDetail(),
            ),
            Padding(
              padding: EdgeInsets.all(40),
              child: _ExtraWeatherDetail(),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 0),
              child: _BottomDetail(),
            )
          ],
        ),
      )),
    );
  }
}

Widget _TextField() {
  return TextField(
    decoration: InputDecoration(
        icon: Icon(Icons.search, color: Colors.white, size: 25),
        border: InputBorder.none,
        label: Text("City Name.."),
        labelStyle: TextStyle(color: Colors.white, fontSize: 20)),
  );
}

Column _CityDetail() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text(
        "Piter, RU",
        style: TextStyle(color: Colors.white, fontSize: 40),
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        "Thursday, Dec 22, 2021",
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      )
    ],
  );
}

Row _TemperatureDetail() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(
        Icons.wb_cloudy,
        size: 70.0,
        color: Colors.white,
      ),
      Column(
        children: <Widget>[
          Text(
            "2 °F",
            style: TextStyle(color: Colors.white, fontSize: 65),
          ),
          Text(
            "Today is cloudy",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    ],
  );
}

Row _ExtraWeatherDetail() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Column(
        children: <Widget>[
          Icon(
            Icons.ac_unit,
            color: Colors.white,
            size: 30.0,
          ),
          Text(
            '5',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26.0,
            ),
          ),
          Text(
            "km/hr",
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
      Column(children: <Widget>[
        Icon(
          Icons.ac_unit,
          size: 30.0,
          color: Colors.white,
        ),
        Text(
          "3",
          style: TextStyle(
            color: Colors.white,
            fontSize: 26.0,
          ),
        ),
        Text(
          "%",
          style: TextStyle(
            color: Colors.white,
          ),
        )
      ]),
      Column(children: <Widget>[
        Icon(
          Icons.ac_unit,
          size: 30.0,
          color: Colors.white,
        ),
        Text(
          "20",
          style: TextStyle(
            color: Colors.white,
            fontSize: 26.0,
          ),
        ),
        Text(
          "%",
          style: TextStyle(color: Colors.white),
        ),
      ]),
    ],
  );
}

Container _BottomDetail() {
  List<String> items = [
    "Monday",
    "Tuseday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];
  return Container(
    height: 150,
    child: ListView.builder(
      padding: EdgeInsets.symmetric(
        vertical: 2.0,
      ),
      itemExtent: 210,
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, int index) {
        return Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.all(16),
            child: ListTile(
              tileColor: Colors.white38,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                    child: Text(
                      items[index],
                      // softWrap: false, В данной ситуации в параметр я передал фолз, значит текст не будет переводиться на новую строку
                      // textAlign: TextAlign.center, Можно было использовать как выравнивание
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "${index + 5} °F",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.wb_sunny,
                            color: Colors.white,
                            size: 50,
                          )
                        ],
                      )),
                ],
              ),
            ));
      },
    ),
  );
}
