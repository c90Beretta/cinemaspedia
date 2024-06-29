

import 'package:cinepedia/config/domain/entities/actor.dart';
import 'package:cinepedia/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider = StateNotifierProvider<ActorsByMovieProvider,Map<String,List<Actor>>>((ref) {
  final actorRepostory = ref.watch(actorsRepositoryProvider);
  return ActorsByMovieProvider(getActors: actorRepostory.getMovieActors);

});
  



/*  MAPA
  {
    '505642': <Actor>[];  --- LLAMADO 
    '505642': <Actor>[];  --- LLAMADO 
    '505642': <Actor>[];  --- LLAMADO 
    '505642': <Actor>[];  --- LLAMADO 

  }
*/ 








typedef GetActorCallBack = Future<List<Actor>> Function(String movieid);

class ActorsByMovieProvider extends StateNotifier <Map<String, List<Actor>>>{
  final GetActorCallBack getActors;
  ActorsByMovieProvider( {required this.getActors,}):super({});

  Future<void> loadActors(String movieid) async{
    if( state[movieid] !=  null) return;
    final List<Actor> actors = await getActors(movieid); 
    state = {...state, movieid: actors};
  }

}