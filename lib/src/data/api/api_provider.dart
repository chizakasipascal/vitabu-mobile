import 'package:dio/dio.dart';
import 'package:vitabu/src/data/dio/dio_client.dart';
import 'package:vitabu/src/models/abonne/list_abonne.dart';
import 'package:vitabu/src/models/diagnostic/diagnostic.dart';
import 'package:vitabu/src/models/mouvement/emprunt_body.dart';
import 'package:vitabu/src/models/mouvement/mouvement.dart';
import 'package:vitabu/src/models/mouvement/remise_body.dart';

import '../endpoint.dart';

class ApiProvider {
  final DioClient _dioClient;

  ApiProvider(this._dioClient);

  Future<Mouvement> getCodeEmprunt(String code) async {
    try {
      final result = await _dioClient.get(
        "${EndPoint.getCode}/$code",
        options: Options(
          contentType: Headers.jsonContentType,
          headers: {
            "Accept": "application/json",
          },
        ),
      );
      return Mouvement.fromJson(result);
    } catch (e) {
      print("ERROR getCodeEmprunt : ${e.toString()}");
      throw e;
    }
  }

  Future<Diagnostic> postEmprunt(EmpruntBody body) async {
    try {
      final result = await _dioClient.post(
        EndPoint.emprunt,
        data: body.toMap(),
        options: Options(
          contentType: Headers.jsonContentType,
          headers: {
            "Accept": "application/json",
          },
        ),
      );
      return Diagnostic.fromJson(result);
    } catch (e) {
      print("ERROR postEmprunt : ${e.toString()}");
      throw e;
    }
  }

  Future<ListAbonne> getAbonnes() async {
    try {
      final result = await _dioClient.get(
        EndPoint.emprunt,
        options: Options(
          contentType: Headers.jsonContentType,
          headers: {
            "Accept": "application/json",
          },
        ),
      );
      return ListAbonne.fromJson(result);
    } catch (e) {
      print("ERROR getAbonnes : ${e.toString()}");
      throw e;
    }
  }

  Future<Diagnostic> postRemise(RemiseBody body) async {
    try {
      final result = await _dioClient.post(
        EndPoint.remise,
        data: body.toMap(),
        options: Options(
          contentType: Headers.jsonContentType,
          headers: {
            "Accept": "application/json",
          },
        ),
      );
      return Diagnostic.fromJson(result);
    } catch (e) {
      print("ERROR postRemise : ${e.toString()}");
      throw e;
    }
  }
}
