part of 'emprunt_bloc.dart';

abstract class EmpruntEvent extends Equatable {
  const EmpruntEvent();

  @override
  List<Object> get props => [];
}

class LoadCodeEmprunt extends EmpruntEvent {
  final String code;

  LoadCodeEmprunt({@required this.code});

  @override
  List<Object> get props => [code];
}

class SaveEmprunt extends EmpruntEvent {
  final EmpruntBody body;

  SaveEmprunt({@required this.body});

  @override
  List<Object> get props => [body];
}
