import 'package:flutter/material.dart';

void main() {
  runApp(const TutorialPage_11_2());
}

class TutorialPage_11_2 extends StatelessWidget {
  const TutorialPage_11_2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ABP Minggu 11',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const MyTechPage(title: 'ABP Minggu 11'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyTechPage extends StatefulWidget {
  const MyTechPage({super.key, required this.title});
  final String title;

  @override
  State<MyTechPage> createState() => _MyTechPageState();
}

class _MyTechPageState extends State<MyTechPage> {
  List<Map<String, dynamic>> data = [
    {
      "title": "Native App",
      "platform": "Android, iOS",
      "lang": "Java, Kotlin, Swift, C#",
      "color": Colors.red,
    },
    {
      "title": "Hybrid App",
      "platform": "Android, iOS, Web",
      "lang": "Javascript, Dart",
      "color": Colors.grey,
    }
  ];
  var titleInput = TextEditingController();
  var platInput = TextEditingController();
  var langInput = TextEditingController();
  List<String> colors = ['blue', 'green', 'yellow'];
  List<DropdownMenuItem<String>> ddItems = [];
  dynamic colSelected;

  @override
  void initState() {
    super.initState();
    for (String col in colors) {
      ddItems.add(
        DropdownMenuItem(
          value: col,
          child: Text(col),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                child: InkWell(
                  child: Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: data[index]['color'],
                        ),
                        const SizedBox(width: 15),
                        Container(
                          margin: const EdgeInsets.only(
                            bottom: 40,
                            left: 10,
                            top: 10,
                          ),
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data[index]["title"],
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 28,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Detail'),
                          content: SingleChildScrollView(
                            child: Container(
                              margin: const EdgeInsets.only(
                                bottom: 40,
                                left: 10,
                                top: 10,
                              ),
                              padding: const EdgeInsets.only(top: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data[index]["title"],
                                    style: const TextStyle(
                                        color: Colors.blue, fontSize: 28),
                                  ),
                                  Text(
                                    data[index]["platform"],
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    data[index]["lang"],
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Close'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          var snackBar = SnackBar(
            content: const Text('Add new tech?'),
            action: SnackBarAction(
              label: 'Add',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      title: const Text('Add New Tech'),
                      children: [
                        Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Tech Name',
                                contentPadding: EdgeInsets.all(10),
                                hintText: 'Tech Name',
                              ),
                              controller: titleInput,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Platform',
                                contentPadding: EdgeInsets.all(10),
                                hintText: 'Platform',
                              ),
                              controller: platInput,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Lang',
                                contentPadding: EdgeInsets.all(10),
                                hintText: 'Lang',
                              ),
                              controller: langInput,
                            ),
                            DropdownButtonFormField(
                                items: ddItems,
                                onChanged: (val) {
                                  setState(() {
                                    colSelected = val;
                                  });
                                }),
                            ElevatedButton(
                              child: const Text('Save'),
                              onPressed: () {
                                if (colSelected == 'blue') {
                                  colSelected = Colors.blue;
                                } else if (colSelected == 'green') {
                                  colSelected = Colors.green;
                                } else if (colSelected == 'yellow') {
                                  colSelected = Colors.yellow;
                                }
                                setState(() {
                                  data.add(
                                    {
                                      'title': titleInput.text,
                                      'platform': platInput.text,
                                      'lang': langInput.text,
                                      'color': colSelected
                                    },
                                  );
                                });
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
      ),
    );
  }
}
