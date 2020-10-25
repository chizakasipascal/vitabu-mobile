import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:vitabu/src/data/network/api/api_repository.dart';
import 'package:vitabu/src/models/emprunt/emprunt_body.dart';
import 'package:vitabu/src/models/mouvement/mouvement.dart';

part 'emprunt_event.dart';
part 'emprunt_state.dart';

class EmpruntBloc extends Bloc<EmpruntEvent, EmpruntState> {
  final ApiRepository api = ApiRepository();

  /*final SharedPreferencesHelper _sharedPreferencesHelper =
  locator<SharedPreferencesHelper>();*/

  EmpruntBloc() : super(EmpruntInitial());

  @override
  Stream<EmpruntState> mapEventToState(
    EmpruntEvent event,
  ) async* {
    if (event is SaveEmprunt) yield* _mapSaveEmpruntToState(event);
    //else if (event is LoadOuvrage) yield* _mapLoadOuvrageToState(event);
  }

  /*Stream<EmpruntState> _mapLoadOuvrageToState(LoadOuvrage event) async* {
    try {
      final response = await api.postEmprunt(event.code);
      if (response != null) {
        if (response.status == 200)
          yield EmpruntReady(mvt: null);
        else
          yield EmpruntError();
      } else
        yield EmpruntError();
    } catch (e) {
      yield EmpruntError();
    }
  }*/

  Stream<EmpruntState> _mapSaveEmpruntToState(SaveEmprunt event) async* {
    try {
      final response = await api.postEmprunt(event.body);
      if (response != null) {
        if (response.status == 200)
          yield EmpruntReady(mvt: null);
        else
          yield EmpruntError();
      } else
        yield EmpruntError();
    } catch (e) {
      yield EmpruntError();
    }
  }
}
