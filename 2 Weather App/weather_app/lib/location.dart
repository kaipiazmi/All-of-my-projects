import 'package:weather_app/Model/locationmodel.dart';
import 'package:weather_app/views/locationresultview.dart';
import 'package:weather_app/services/locationservice.dart';
import 'package:flutter/material.dart';

class locationw extends StatefulWidget {
  const locationw({
    Key? key,
  }) : super(key: key);

  @override
  State<locationw> createState() => _locationwState();
}

class _locationwState extends State<locationw> {
  TextEditingController controller = TextEditingController();
  DataService dataService = DataService();
  Lokasi lokasi = Lokasi();
  bool isFetch = false;
  bool isLoading = false;
  String errorMessage = '';

  List<Widget> resultWidgets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 80.0,
            ),
            Text(
              'Masukkan nama kota yaa',
              style: TextStyle(
                  fontSize: 18.0, color: Color.fromRGBO(234, 234, 234, 1.0)),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent, // Warna latar belakang tombol
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  ),
                  onPressed: () async {
                    final cityName = controller.text;

                    if (cityName.isEmpty) {
                      setState(() {
                        errorMessage =
                            'Nama kota masih kosong ni tolong isi yaa >_<';
                      });
                      return;
                    }

                    setState(() {
                      resultWidgets.clear();
                      isFetch = true;
                      isLoading = true;
                      errorMessage = ''; // Reset errorMessage
                    });

                    try {
                      lokasi = await dataService.FetchEvent(cityName);
                      setState(() {
                        resultWidgets.add(
                          LokasiCuaca(
                            cityName: cityName,
                            lokasi: lokasi,
                          ),
                        );
                      });
                    } catch (error) {
                      setState(() {
                        errorMessage =
                            'Sepertinya nama Kota yang anda \nmasukkan salah mohon cek kembali ^_^';
                      });
                    } finally {
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                  child: Text('Cari'),
                ),
                SizedBox(width: 10.0),
                Card(
                  elevation: 1,
                  color: Color.fromRGBO(60, 71, 100, 1.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: Container(
                    width: 225,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
                      child: TextField(
                        controller: controller,
                        style: TextStyle(
                          color: Color.fromRGBO(234, 234, 234, 1.0),
                        ),
                        decoration: InputDecoration(labelText: 'Nama Kota'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0),
            if (errorMessage.isNotEmpty)
              Text(
                errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            Expanded(
              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView(
                      children: resultWidgets,
                    ),
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(18, 29, 59, 1.0),
    );
  }
}

String capitalizeEveryWord(String text) {
  if (text.isEmpty) return text;

  List<String> words = text.split(' ');
  List<String> capitalizedWords = words.map((word) {
    if (word.isEmpty) return word;
    return word[0].toUpperCase() + word.substring(1);
  }).toList();

  return capitalizedWords.join(' ');
}

TextStyle titleFont =
    const TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0);

TextStyle infoFont =
    const TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0);

Color rgbColor = Color.fromRGBO(135, 206, 235, 1.0);
