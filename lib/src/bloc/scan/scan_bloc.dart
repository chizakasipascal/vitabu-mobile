import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';
import 'package:meta/meta.dart';

part 'scan_event.dart';
part 'scan_state.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  ScanBloc() : super(ScanInitial());

  @override
  Stream<ScanState> mapEventToState(
    ScanEvent event,
  ) async* {
    if (event is StartScan)
      _mapStartScanToState();
    else if (event is StopScan) _mapStopScanToState();
  }

  Stream<ScanState> _mapStartScanToState() async* {
    yield ScanInProgress();
    try {
      final response = await FlutterNfcReader.read();
      if (response != null) {
        if (response.status == NFCStatus.reading)
          yield ScanReading(content: response.id);
        else
          yield ScanPending();
      }
    } catch (e) {
      yield ScanError();
    }
  }

  Stream<ScanState> _mapStopScanToState() async* {
    yield ScanPending();
    try {
      final response = await FlutterNfcReader.stop();
      if (response != null) if (response.status == NFCStatus.stopped)
        yield ScanStopped();
    } catch (e) {
      yield ScanError();
    }
  }
}
