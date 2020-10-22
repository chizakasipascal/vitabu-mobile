import 'package:dio/dio.dart';
import 'package:vitabu/src/data/network/dio/dio_client.dart';

import 'api_provider.dart';

class ApiRepository {
  final ApiProvider _apiProvider = ApiProvider(DioClient(Dio()));

  // TODO: Ajouter les fonctions pour l'accès aux données
}
