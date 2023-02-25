class Twfm {
  String name;
  String grade;
  String desc;
  String series;
  String price;
  String imageAsset;
  String imageGrade;
  List<String> imageUrls;
  String ytlink;

  Twfm({
    required this.name,
    required this.grade,
    required this.desc,
    required this.series,
    required this.price,
    required this.imageAsset,
    required this.imageGrade,
    required this.imageUrls,
    required this.ytlink,
  });
}

List<Twfm> twfmList = [
  Twfm(
      name: 'Aerial',
      grade: 'HG',
      desc:
          'The GNT-0000 00 Qan[T] (aka 00Q, 00 Qan[T], pronounced "Double-Oh Quanta") is the successor to the GN-0000+GNR-010 00 Raiser in Mobile Suit Gundam 00 The Movie: Awakening of the Trailblazer. It is piloted by Setsuna F. Seiei.',
      series: 'Mobile Suit Gundam 00',
      price: '400.000',
      imageAsset: 'images/Aerial.jpg',
      imageGrade: 'images/HGlogo.webp',
      ytlink: 'mYd_l3E7yOc',
      imageUrls: [
        'https://bbts1.azureedge.net/images/p/full/2020/05/a5d0f4b3-f8d7-4363-a569-ed615deb9e52.jpg',
        'https://i.pinimg.com/originals/dd/90/05/dd900555f709b81cbd0060f5c7884012.jpg',
        'https://1.bp.blogspot.com/-d4a_dKZwpbk/V0h3rdKEdiI/AAAAAAAKwpo/nmDWJOjlQmsMRiUf0V73BcGkKrZeY0wzQCLcB/s1600/20160527_900167.jpg'
      ]),
];
