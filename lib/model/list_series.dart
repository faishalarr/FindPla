// ignore: file_names
class SeriesModel {
  //data Type
  String name;
  String category;
  String imageURL;
  String episodes;
  String date;
  String seasons;
  String ytlink;

// constructor
  SeriesModel({
    required this.name,
    required this.category,
    required this.imageURL,
    required this.episodes,
    required this.seasons,
    required this.date,
    required this.ytlink,
  });
}

List<SeriesModel> serieslist = [
  SeriesModel(
      name: 'Mobile Suit \nGundam 00',
      category: 'Series',
      imageURL:
          "https://www.themoviedb.org/t/p/original/dcUTOm6XXLT2ITQVCubkSwQ6qCE.jpg",
      episodes: '50',
      seasons: '2 Season',
      date: '2008',
      ytlink: 'mYd_l3E7yOc'),
  SeriesModel(
      name: 'The Witch From Mercury',
      category: 'Series',
      imageURL:
          "https://upload.wikimedia.org/wikipedia/en/0/0b/The_Witch_from_Mercury.jpg",
      episodes: '50',
      seasons: '2 Season',
      date: '2022',
      ytlink: 'mYd_l3E7yOc')
];
