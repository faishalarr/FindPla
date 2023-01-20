import 'package:flutter/material.dart';

class aboutGunpla extends StatelessWidget {
  const aboutGunpla({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 20, left: 10),
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 15, top: 20),
                        child: Text(
                          'About Gunpla',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20, right: 10),
                child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Gunpla_Logo.svg/1200px-Gunpla_Logo.svg.png'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Gunpla (ガンプラ Ganpura) atau yang lebih dikenal dengan kepanjangan \“Gundam Plastic Model kit”\ adalah plastik Model kit Gundam  yang Pembuatan gunpla diadaptasi dari anime berjudul Mobile Suit Gundam dan diproduksi oleh Bandai, yang memiliki lisensi eksklusif di bidang manufaktur dan pemasaran di seluruh dunia. Dari namanya model kit pasti sudah bisa ditebak ya harus dirakit. \n\nGunpla terdiri dari cetakan model plastik; sprues dengan plastik jenis Polystyrene (PS) yang kemudian harus dipotong sebelum perakitan. kebanyakan model pasca-1990 sudah memiliki bagian snap-fit dan sudah tidak lagi membutuhkan perekat seperti semen plastik seperti pada model sebelumnya. \n\nPlastik model kit Gundam biasanya disertakan dengan stiker atau waterslide decal/dry decal untuk menerapkan warna tambahan dan detail tanda tanda seperti caution atau warning seperti terlihat pada gundam aslinya di Tv series.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
