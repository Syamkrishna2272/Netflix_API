class AddMovie {
  final String title;
  final String overview;
  final String posterpath;
  final String coverImage;
  final double popularity;
  final String releaseDate;

  AddMovie(
      {required this.title,
      required this.overview,
      required this.posterpath,
      required this.coverImage,
      required this.popularity,
      required this.releaseDate});

  factory AddMovie.fromjason(Map json) => AddMovie(
        title: json['title'],
        overview: json['overview'],
        posterpath: json['poster_path'],
        popularity: json['popularity'],
        coverImage: json['backdrop_path'],
        releaseDate: json['release_date'],
      );
}