import 'package:flutter/material.dart';
import 'ResultPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BmiCalculator(),
    );
  }
}

// pertama saya membuat class BmiCalculator yang merupakan stateful widget
class BmiCalculator extends StatefulWidget {
  BmiCalculator({Key? key}) : super(key: key);

  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  bool isMale = false;
  bool isFemale =
      false; // saya membuat variabel isMale dan isFemale false supaya ketika dijalankan tidak ada yang terpilih
  int height = 100;
  double weight = 50;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(
              // disini saya membuat appbar untuk judulnya trus di center
              centerTitle: true,
              title: const Text(
                "BMI Calculator",
                style: TextStyle(color: Colors.white),
              ),
              elevation: 0.0,
            ),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  const SizedBox(
                    // saya membuat const SizedBox untuk membuat jarak antar widget
                    height: 50.0,
                  ),
                  Row(
                      // disini saya membuat widget dalam row untuk memilih Gender Male atau Female
                      mainAxisAlignment: MainAxisAlignment
                          .spaceEvenly, // saya membuat mainAxisAlignment spaceEvenly supaya widget yang ada didalam row terlihat rapi
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height:
                                  150, // ini untuk memberikan ukuran tinggi pada widget
                              width:
                                  150, // ini untuk memberikan ukuran lebar pada widget
                              color: isMale
                                  ? Colors.blue
                                  : Colors
                                      .white, // saya membuat kondisi jika isMale true maka warna akan berubah menjadi biru jika false maka akan berubah menjadi putih
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isMale = !isMale;
                                        isFemale = false;
                                      });
                                    },
                                    icon: Icon(Icons.male,
                                        color: isMale
                                            ? Colors.white
                                            : Colors.blue),
                                    iconSize: 80,
                                  )
                                ],
                              ),
                            )),
                        ClipRRect(
                            // disini saya cuman duplikat dari ClipRRect diatas (isMale) karena saya ingin membuat widget yang sama
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: 150,
                              width: 150,
                              color:
                                  isFemale ? Colors.pinkAccent : Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isFemale = !isFemale;
                                        isMale = false;
                                      });
                                    },
                                    icon: Icon(Icons.female,
                                        color: isFemale
                                            ? Colors.white
                                            : Colors.pinkAccent),
                                    iconSize: 80,
                                  )
                                ],
                              ),
                            )),
                      ]),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Column(
                      // disini saya membuat column untuk memilih tinggi badan
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('Height: ', style: TextStyle(fontSize: 20)),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          '${height.toString()} cm', // saya membuat text untuk menampilkan tinggi badan sesuai dengan data dalam widget slider
                          style: const TextStyle(fontSize: 20),
                        ),
                        Slider(
                          value: height.toDouble(),
                          min:
                              100, // saya membuat min dan max untuk mengatur batas tinggi badan yang bisa diinput
                          max: 250,
                          onChanged: (value) {
                            setState(() {
                              height = value
                                  .round(); // saya membuat value.round() untuk mengatur angka yang ditampilkan dalam text supaya tidak angka desimal
                            });
                          },
                        )
                      ]),
                  const Column(
                      // disini saya membuat column untuk membuat widget berat badan
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Weight: ', style: TextStyle(fontSize: 20)),
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FloatingActionButton(
                        // disini saya membuat floatingActionButton untuk mendapat tampilan bulat
                        backgroundColor: Colors.white,
                        child: const Icon(
                          Icons
                              .remove, // disini saya membuat icon - untuk menginformasikan bahwa ini untuk mengurangi berat badan
                          color: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            weight--; // berfungsi untuk mengurangi nilai weight
                          });
                        },
                      ),
                      Text(
                        '${weight.toString()} kg',
                        style: const TextStyle(fontSize: 20),
                      ),
                      FloatingActionButton(
                        // melakukan hal yang sama seperti diatas tetapi ini untuk menambah berat badan
                        backgroundColor: Colors.white,
                        child: const Icon(
                          Icons.add,
                          color: Colors.green,
                        ),
                        onPressed: () {
                          setState(() {
                            weight++;
                          });
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 33.0,
                  ),
                  Column(
                    //langkah terakhir dalam halaman pertama ini saya membuat tombol untuk menghitung data yang sudah diinput
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        // saya wrap elevatedButton dalam sizedBox untuk mengatur ukuran tinggi dan lebar tombol
                        height: 80,
                        width: 1000,
                        child: ElevatedButton(
                          onPressed: () {
                            double bmiResult = weight /
                                ((height / 100) *
                                    (height /
                                        100)); // disini saya membuat rumus untuk menghitung BMI
                            String bmiClassification;
                            // disini saya membuat kondisi jika isMale true maka akan menghitung BMI sesuai dengan rumus BMI laki-laki jika false maka akan menghitung BMI sesuai dengan rumus BMI perempuan
                            if (isMale) {
                              if (bmiResult < 18) {
                                bmiClassification = 'Underweight';
                              } else if (bmiResult >= 18 && bmiResult < 25) {
                                bmiClassification = 'Normal';
                              } else if (bmiResult >= 25 && bmiResult <= 27) {
                                bmiClassification = 'Overweight';
                              } else {
                                bmiClassification = 'Obese';
                              }
                            } else {
                              if (bmiResult < 17) {
                                bmiClassification = 'Underweight';
                              } else if (bmiResult >= 17 && bmiResult < 23) {
                                bmiClassification = 'Normal';
                              } else if (bmiResult >= 23 && bmiResult <= 27) {
                                bmiClassification = 'Overweight';
                              } else {
                                bmiClassification = 'Obese';
                              }
                            }
                            // saya membuat fungsi kalimat untuk menampilkan kalimat yang sesuai dengan kondisi di atas
                            String Kalimat() {
                              if (bmiClassification == 'Underweight') {
                                return 'You need to eat more';
                              } else if (bmiClassification == 'Normal') {
                                return 'You are healthy';
                              } else if (bmiClassification == 'Overweight') {
                                return 'You need to exercise more';
                              } else {
                                return 'You need to excerise more and eat less';
                              }
                            }

                            // disini saya membuat navigator untuk berpindah halaman ke halaman ResultPage menggunakan .push untuk mengirim data ke halaman selanjutnya
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResultPage(bmiResult,
                                        bmiClassification, Kalimat())));
                          },
                          child: const Text('Calculate'),
                        ),
                      )
                    ],
                  ),
                ]))));
  }
}
