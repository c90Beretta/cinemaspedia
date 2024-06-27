import 'package:cinepedia/config/domain/entities/movie.dart';
import 'package:cinepedia/config/infraestructure/models/moviedb/movie_details.dart';
import 'package:cinepedia/config/infraestructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBtoEntity(MovieDBData moviedb) => Movie(
      adult: moviedb.adult,
      backdropPath: (moviedb.backdropPath != "")
      ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
      : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1mcHVzLjjPjJNNYOT8v2f0rYU2C5wzvf_BnvhayR8N6ENCTXSP9quG0ejpmJ2w6EBWYw&usqp=CAU',
      genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: (moviedb.posterPath != "")
      ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
      : 'No-Poster',
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount);
  
  static Movie movieDetailstoEntity(MovieDetails moviedb) => Movie(
      adult: moviedb.adult,
      backdropPath: (moviedb.backdropPath != "")
      ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
      : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1mcHVzLjjPjJNNYOT8v2f0rYU2C5wzvf_BnvhayR8N6ENCTXSP9quG0ejpmJ2w6EBWYw&usqp=CAU',
      genreIds: moviedb.genres.map((e) => e.name).toList(),
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: (moviedb.posterPath != "")
      ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
      : 'No-Poster',
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount);
  
}
