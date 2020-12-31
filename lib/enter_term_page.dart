import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EnterTermPage extends StatefulWidget {
  static final valueKey = ValueKey('EnterTermsPage');

  EnterTermPage({Key key, this.searchForTerm}) : super(key: key);
  final ValueChanged<String> searchForTerm;
  @override
  State<StatefulWidget> createState() => _EnterTermPage();
}

class _EnterTermPage extends State<EnterTermPage> {
  final _textFieldController = TextEditingController();

  //This is a function which is printing text of our text field
  void search() {
    widget.searchForTerm(_textFieldController.text);
  }

  // This is a function which is returning a widget
  Widget searchForm() {
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textFieldController,
              decoration: InputDecoration(
                labelText: 'Enter Term',
              ),
            ),
            FlatButton(
                onPressed: () => search(),
                color: Colors.green,
                textColor: Colors.white,
                child: Text(
                  'Search',
                ))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dictionary'),
      ),
      body: searchForm(),
    );
  }
}
