import 'package:dio/dio.dart';
import 'package:vitabu/src/data/dio/dio_client.dart';
import 'package:vitabu/src/models/abonne/list_abonne.dart';
import 'package:vitabu/src/models/diagnostic/diagnostic.dart';
import 'package:vitabu/src/models/mouvement/emprunt_body.dart';
import 'package:vitabu/src/models/mouvement/mouvement.dart';
import 'package:vitabu/src/models/mouvement/remise_body.dart';

import 'api_provider.dart';

class ApiRepository {
  final ApiProvider _apiProvider = ApiProvider(DioClient(Dio()));

  Future<Mouvement> getCodeEmprunt(String code) =>
      _apiProvider.getCodeEmprunt(code);

  Future<Diagnostic> postEmprunt(EmpruntBody body) =>
      _apiProvider.postEmprunt(body);

  Future<ListAbonne> getAbonnes() => _apiProvider.getAbonnes();

  Future<Diagnostic> postRemise(RemiseBody body) =>
      _apiProvider.postRemise(body);
}
