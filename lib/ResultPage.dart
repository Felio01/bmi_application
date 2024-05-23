import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  // di sini kita menggunakan StatelessWidget karena kita tidak akan mengubah apapun pada halaman ini dan untuk mempercepat loading
  final double bmiResult;
  final String bmiClassification;
  final String kalimat;

  ResultPage(this.bmiResult, this.bmiClassification, this.kalimat);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("BMI Result")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                //jarak dari appbar ke text 'Result'
                height: 20.0,
              ),
              const Text('Result', style: TextStyle(fontSize: 30.0)),
              const SizedBox(
                height: 40.0,
              ),
              Text('$bmiClassification',
                  style: const TextStyle(
                      fontSize:
                          35.0)), //menampilkan hasil klasifikasi BMI dari page sebelumnya
              const SizedBox(
                height: 60.0,
              ),
              Text(
                '${bmiResult.round()} Kg/m2', //menampilkan hasil perhitungan BMI dari page sebelumnya
                style: const TextStyle(fontSize: 70.0),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Text(
                "$kalimat", //menampilkan kalimat yang sesuai dengan hasil perhitungan BMI dari page sebelumnya
                style: const TextStyle(fontSize: 20.0),
              ),
              const SizedBox(
                height: 95.0,
              ),
              SizedBox(
                height: 80,
                width: 1000,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); //kembali ke halaman sebelumnya
                  },
                  child: const Text('Re-Calculate'),
                ),
              )
            ],
          ),
        ));
  }
}
