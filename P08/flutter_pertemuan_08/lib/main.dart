import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Praktikum 8',
      home: const HomePage(),
      // theme: ThemeData.dark(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List BungoStrayDog = [
    {'name': 'Osamu Dazai', 'nim': '2006061'},
    {'name': 'Kyouka Izumi', 'nim': '2006061'},
    {'name': 'Ranpo Edogawa', 'nim': '2006999'},
    {'name': 'Atshusi Nakajima', 'nim': '2006989'},
    {'name': 'Doppo Kunikida', 'nim': '2006976'},
    {'name': 'Akiko Yasano', 'nim': '2006969'},
  ];

  Future getBungoStrayDogs() async {
    await Future.delayed(Duration(seconds: 5));
    return BungoStrayDog;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Builder'),
      ),
      body: FutureBuilder(
          future: getBungoStrayDogs(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasData) {
                return ListView (
                  children: [
                    ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                      return CardStrayDogs(
                        name: snapshot.data[index]['name'],
                        nim: snapshot.data[index]['nim'],
                      );
                    })
                  ],
                );
              } else {
                return const Center(
                  child: Text('Tidak ada data'),
                );
              }
            }
          }),
    );
  }
}

class CardStrayDogs extends StatelessWidget {
  const CardStrayDogs({
    super.key,
    required this.name,
    required this.nim,
  });

  final String name;
  final String nim;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {},
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://i.pinimg.com/originals/03/05/4f/03054f48ace28fcb860ad746efd0b13f.png'),
        ),
        title: Text(name),
        subtitle: Text(nim),
      ),
    );
  }
}
