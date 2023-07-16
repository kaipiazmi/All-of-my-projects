import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crudapp_todolist/services/todo_service.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> todos = [];
  String input = "";
  final TodoService todoService = TodoService();
  TextEditingController _editTextController = TextEditingController();

  @override
  void dispose() {
    _editTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(157, 178, 191, 1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: SafeArea(
          child: AppBar(
            backgroundColor: Color.fromRGBO(157, 178, 191, 1),
            elevation: 0.0,
            flexibleSpace: Container(
              margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                      20.0), // Ganti nilai 20.0 dengan radius yang Anda inginkan
                ),
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 191, 203, 214),
                    Color.fromARGB(255, 236, 243, 251)
                  ], // Ganti dengan warna yang diinginkan
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Image(
                    image: AssetImage('assets/konoha.png'),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Color.fromRGBO(222, 159, 159, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  title: Column(
                    children: [
                      Text("Add Notes", style: titleFont),
                      Image.asset(
                        'assets/itachi.png',
                        width: 200,
                        height: 275,
                      ),
                    ],
                  ),
                  content: TextField(
                    onChanged: (String value) {
                      input = value;
                    },
                  ),
                  actions: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              todos.add(input);
                            });
                            todoService.createTodos(input);
                            Navigator.of(context).pop();
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/itachi2.png',
                                  width: 70,
                                  height: 70,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          },
          child: Image.asset(
            "assets/icon.png",
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/naruto.png",
                    width: 200,
                    height: 194,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('My Notes', style: titleFont),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Color.fromARGB(255, 2, 2, 2),
                    height: 1,
                    width: 335,
                    child: Divider(),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.transparent,
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection("MyTodos")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    todos.clear();
                    final docs = snapshot.data?.docs;
                    if (docs != null) {
                      for (var doc in docs) {
                        todos.add(doc.get('todoTitle'));
                      }
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: docs?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Card(
                              color: Color.fromRGBO(79, 115, 160, 1),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 25.0, vertical: 10.0),
                              child: ListTile(
                                title: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 15, 0, 15),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/shuriken.png',
                                        width: 24,
                                        height: 24,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        docs?[index].get('todoTitle') ?? '',
                                        style: subFont,
                                      ),
                                    ],
                                  ),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 28,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image:
                                              AssetImage('assets/pencil.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          String newTitle =
                                              docs?[index].get('todoTitle') ??
                                                  '';
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              _editTextController.text =
                                                  newTitle;
                                              return AlertDialog(
                                                backgroundColor: Color.fromRGBO(
                                                    139, 186, 191, 1),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                title: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text("Edit Note",
                                                        style: titleFont),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Image.asset(
                                                      'assets/neji.png',
                                                      width: 100,
                                                      height: 177,
                                                    ),
                                                  ],
                                                ),
                                                content: TextField(
                                                  controller:
                                                      _editTextController,
                                                  onChanged: (String value) {
                                                    newTitle = value;
                                                  },
                                                ),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () {
                                                      todoService.updateTodos(
                                                        docs?[index].id ?? '',
                                                        newTitle,
                                                      );
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(0, 0, 0, 0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.asset(
                                                            'assets/neji2.png',
                                                            width: 70,
                                                            height: 70,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    InkWell(
                                      onTap: () {
                                        todoService
                                            .deleteTodos(docs?[index].id ?? '')
                                            .then((_) {
                                          setState(() {
                                            todos.removeAt(index);
                                          });
                                        });
                                      },
                                      child: Container(
                                        width: 28,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                                AssetImage('assets/trash.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

TextStyle titleFont = GoogleFonts.roboto(
  fontWeight: FontWeight.bold,
  fontSize: 20.0,
  color: Color.fromRGBO(19, 19, 19, 0.8),
);

TextStyle subFont = GoogleFonts.roboto(
  fontWeight: FontWeight.w700,
  fontSize: 16.0,
  color: Color.fromRGBO(22, 23, 23, 0.8),
);
