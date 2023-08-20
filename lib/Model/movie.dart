

class Movies {
  int id;
  String movieName;
  int releasingYear;
  String imageUrl;

  Movies(
    this.id,
    this.movieName,
    this.releasingYear,
    this.imageUrl,
  );

  static final moviessList = [
    Movies(1, "Inception", 2010,
        "https://m.media-amazon.com/images/I/51jGDXepr2L._AC_SY679_.jpg"),
    Movies(2, "The Shawshank Redemption", 1994,
        "https://m.media-amazon.com/images/I/51NZVFJ+COL._AC_SY679_.jpg"),
    Movies(3, "The Lord of the Rings: The Fellowship of the Ring", 2001,
        "https://m.media-amazon.com/images/I/81L+d2ZxBNL._AC_SY679_.jpg"),
    Movies(4, "Pulp Fiction", 1994,
        "https://m.media-amazon.com/images/I/71i6m0+aQ6L._AC_SY679_.jpg"),
    Movies(5, "The Dark Knight", 2008,
        "https://m.media-amazon.com/images/I/81Q+rb0pYDL._AC_SY679_.jpg"),
  ];
}
