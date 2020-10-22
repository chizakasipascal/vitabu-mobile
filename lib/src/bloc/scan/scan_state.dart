part of 'scan_bloc.dart';

abstract class ScanState extends Equatable {
  const ScanState();

  @override
  List<Object> get props => [];
}

class ScanInitial extends ScanState {}

class ScanInProgress extends ScanState {}

class ScanReading extends ScanState {
  final String content;

  ScanReading({@required this.content});

  @override
  List<Object> get props => [content];
}

class ScanPending extends ScanState {}

class ScanStopped extends ScanState {}

class ScanError extends ScanState {}
