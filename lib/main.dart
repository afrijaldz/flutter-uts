import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventori Kendaraan',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Inventori Kendaraan'),
        ),
        body: Container(
          padding: EdgeInsets.all(32),
          child: MyAppWidget(),
        ),
      ),
    );
  }
}

class MyAppWidget extends StatefulWidget {
  @override
  _MyAppWidgetState createState() => _MyAppWidgetState();
}

class _MyAppWidgetState extends State<MyAppWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController merkController = TextEditingController();

  List<String> items = ["Toyota"];

  @override
  Widget build(BuildContext context) {
    Widget listOfWidgets(List<String> items) {
      List<Widget> list = List<Widget>();

      for (var i = 0; i < items.length; i++) {
        list.add(Container(
          padding: EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("${i + 1}.", style: TextStyle(fontSize: 24),),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "${items[i]}",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
                ),
              )
            ],
          ),
        ));
      }

      return Wrap(children: list);
    }

    Widget vehicleSection = Container(
      child: Column(
        children: [listOfWidgets(items)],
      ),
    );

    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        vehicleSection,
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: merkController,
                decoration:
                    const InputDecoration(hintText: 'Masukkan Merk Kendaraan'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        items.add(merkController.text);
                      });
                      merkController.clear();
                    },
                    child: const Text('Simpan')),
              )
            ],
          ),
        )
      ],
    );
  }
}
