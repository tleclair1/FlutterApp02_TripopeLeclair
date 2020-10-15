import 'package:flutter/material.dart';

class MyFirstPage extends StatefulWidget {
  @override
  _MyFirstPageState createState() => _MyFirstPageState();
}

class _MyFirstPageState extends State<MyFirstPage> {
  bool _enabled = false;
  String _msg1 = '';
  String _msg2 = '';
  int count = 0;

  @override
  Widget build(BuildContext context) {
    Object onPressed1() {
      if (_enabled) {
        setState(() {
          count > 0 ? _msg1 = 'Clicked $count' : _msg1 = 'Click Me';
        });
        return () {
          setState(() {
            count > 0 ? _msg1 = 'Clicked $count' : _msg1 = 'Click Me';
          });
          count++;
          print(count);
        };
      } else {
        setState(() {
          _msg1 = '';
        });
        return null;
      }
    }

    Object onPressed2() {
      if (_enabled) {
        setState(() {
          _msg2 = 'Reset';
        });
        return () {
          setState(() {
            _msg1 = 'Click Me';
          });
          count = 0;
          print(count);
        };
      } else {
        setState(() {
          _msg2 = '';
        });
        return null;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Button Functionality Demo'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Enable functionality'),
                Switch(
                    value: _enabled,
                    onChanged: (bool onChangedValue) {
                      _enabled = onChangedValue;
                      setState(() {
                        if (_enabled) {
                          _msg1 = 'Enabled';
                        } else {
                          _msg1 = '';
                        }
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 8,
                    textColor: Colors.red.shade100,
                    color: Colors.redAccent,
                    highlightColor: Colors.blue,
                    splashColor: Colors.green.shade300,
                    padding: EdgeInsets.all(20.0),
                    onPressed: onPressed1(),
                    child: Text(_msg1),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 8,
                    textColor: Colors.blue.shade100,
                    color: Colors.blue,
                    highlightColor: Colors.red,
                    splashColor: Colors.green.shade300,
                    padding: EdgeInsets.all(20.0),
                    onPressed: onPressed2(),
                    child: Text(_msg2),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
