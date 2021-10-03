import 'package:flutter/material.dart';

class SelectCity extends StatelessWidget {
  SelectCity({Key? key}) : super(key: key);
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        debugPrint(_textController.text);
        if (_textController.text == '') {
          return await _onBackPressed(context);
        } else {
          Navigator.pop(context, _textController.text);
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Şehir Seç'),
          leading: InkWell(
            onTap: () {
              _textController.text == ''
                  ? _onBackPressed(context)
                  : Navigator.pop(context, _textController.text);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black54,
            ),
          ),
        ),
        body: Form(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // initialValue: 'kaan.g',
                validator: (deger) {
                  if (deger!.length < 3) {
                    return 'Şehir En az 3 karekterli olmalı';
                  } else
                    return null;
                },
                controller: _textController,
                decoration: InputDecoration(
                  labelText: "Şehir",
                  hintText: "Şehir Seçin",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: IconButton(
                  onPressed: () {
                    debugPrint(_textController.text);
                    _textController.text == ''
                        ? _onBackPressed(context)
                        : Navigator.pop(context, _textController.text);
                  },
                  icon: Icon(Icons.search)),
            )
          ],
        )),
      ),
    );
  }
}

// ignore: slash_for_doc_comments
/*****Pop up alert alarm uyarı ekran kontrolü */
Future<bool> _onBackPressed(BuildContext context) async {
  return await showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          // title: new Text(''),
          content: new Text(
            'Şehir boş olamaz !!!',
          ),
          actions: <Widget>[
            new GestureDetector(
              onTap: () => Navigator.of(context).pop(false),
              child: Center(child: Text("OK")),
            ),
            // SizedBox(height: 16),
            // new GestureDetector(
            //   onTap: () => Navigator.of(context).pop(true),
            //   child: Text("YES"),
            // ),
          ],
        ),
      ) ??
      false;
}
