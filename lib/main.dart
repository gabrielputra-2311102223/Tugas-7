import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> clubs = [
    {
      'name': 'Barcelona',
      'image': 'assets/images/barcelona.jpg',
      'desc': 'Klub asal Spanyol.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Klub Sepak Bola'),
      ),

      body: ListView.builder(
        itemCount: clubs.length,

        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),

            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(10),
            ),

            child: Row(
              children: [

                Image.asset(
                  clubs[index]['image']!,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),

                SizedBox(width: 10),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      Text(
                        clubs[index]['name']!,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 10),

                      Text(clubs[index]['desc']!),

                      SizedBox(height: 10),

                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(),
                            ),
                          );
                        },

                        child: Text('Detail'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),

      floatingActionButton:
          FloatingActionButton(
        child: Icon(Icons.person),

        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  FormPage(),
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Klub'),
      ),

      body: Center(
        child: Text(
          'Barcelona adalah klub besar dunia.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class FormPage extends StatefulWidget {
  @override
  State<FormPage> createState() =>
      _FormPageState();
}

class _FormPageState extends State<FormPage> {

  TextEditingController controller =
      TextEditingController();

  void submit() {

    ScaffoldMessenger.of(context)
        .showSnackBar(
      SnackBar(
        content: Text(
          'Pemain favorit: ${controller.text}',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Form Pemain'),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller: controller,

              decoration: InputDecoration(
                labelText: 'Nama Pemain',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: submit,
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}