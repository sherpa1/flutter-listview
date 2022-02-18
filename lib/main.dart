import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class People {
  int id;
  String firstname;
  String lastname;
  String email;

  People(
      {required this.id,
      required this.firstname,
      required this.lastname,
      required this.email});
}

//global data source
List<People> fakePeople = List.generate(
    50,
    (i) => People(
        id: i + 1,
        firstname: faker.person.firstName(),
        lastname: faker.person.lastName(),
        email: faker.internet.email()));

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PeopleMaster(
        people: fakePeople,
      ), /*remove const before PeopleMaster constructor as fakePeople is a dynamic source*/
    );
  }
}

class PeopleMaster extends StatefulWidget {
  const PeopleMaster({Key? key, required this.people}) : super(key: key);

  final List<People> people;

  @override
  State<PeopleMaster> createState() => _PeopleMasterState();
}

class _PeopleMasterState extends State<PeopleMaster> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("People Master"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: widget.people.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(widget.people[index].firstname),
            );
          },
        ),
      ),
    );
  }
}
