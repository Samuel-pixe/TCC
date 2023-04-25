import 'package:flutter/material.dart'; 
 


class Dropdown extends StatefulWidget {
    @override
    _DropdownState createState() {
      return _DropdownState();
    }
  }
  
  class _DropdownState extends State<Dropdown> {
    String? _value;
  
    @override
    Widget build(BuildContext context) {
      return Center(
        child: DropdownButton<String>(
          items: [
            DropdownMenuItem<String>(
              child: Text('Item 1'),
              value: 'one',
            ),
            DropdownMenuItem<String>(
              child: Text('Item 2'),
              value: 'two',
            ),
            DropdownMenuItem<String>(
              child: Text('Item 3'),
              value: 'three',
            ),
          ],
          onChanged: (String? value) {
            setState(() {
              _value = value;
            });
          },
          hint: Text('Select Item'),
          value: _value,
        ),
      );
    }
  }