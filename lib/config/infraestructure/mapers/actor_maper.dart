

import 'package:cinepedia/config/domain/entities/actor.dart';
import 'package:cinepedia/config/infraestructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
    id: cast.id,
    name: cast.name,
    character: cast.character ?? 'No character',
    profilePath: cast.profilePath != null
    ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
    : 'https://www.shutterstock.com/image-vector/default-avatar-photo-placeholder-grey-260nw-2010557507.jpg',
    
  );
    
  
}