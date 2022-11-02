import 'package:flutter/material.dart';
import 'package:happy_birthday_calculator/src/models/gift.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController moneyController = TextEditingController();
  TextEditingController personCountController = TextEditingController();

  final List<Gift> names = <Gift>[];
  void _addNames() {
    setState(() {
      names.insert(
          0, Gift(nameController.text, int.parse(moneyController.text)));
      nameController.clear();
      moneyController.clear();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    personCountController.text = "0";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Happy Birthday MF!"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              personCountForm(),
              addForm(),
              addButton(),
              const Divider(),
              listView(),
              const Divider(),
              Text(
                  "На рыло: ${names.fold(0, (sum, item) => sum + item.money) / int.parse(personCountController.text)}"),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addNames,
        tooltip: 'Increment',
        icon: const Icon(Icons.save),
        label: const Text("Calculate"),
      ),
    );
  }

  Widget addForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            ),
          ),
          Expanded(
            child: TextField(
              controller: moneyController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Money',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget addButton() {
    return ElevatedButton(
      child: const Text('Add chuckmeks'),
      onPressed: () {
        _addNames();
      },
    );
  }

  Widget listView() {
    return Expanded(
      child: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          String name = names[index].name;
          int money = names[index].money;
          return ListTile(
            title: Text(name),
            subtitle: Text("$money"),
          );
        },
      ),
    );
  }

  Widget personCountForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: personCountController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Person count',
        ),
      ),
    );
  }
}
