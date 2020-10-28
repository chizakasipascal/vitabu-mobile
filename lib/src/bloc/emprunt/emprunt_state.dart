part of 'emprunt_bloc.dart';

abstract class EmpruntState extends Equatable {
  const EmpruntState();

  @override
  List<Object> get props => [];
}

class EmpruntInitial extends EmpruntState {}

class EmpruntReady extends EmpruntState {
  final Mouvement mvt;

  EmpruntReady({@required this.mvt});

  @override
  List<Object> get props => [mvt];
}

class EmpruntSuccess extends EmpruntState {
  final Diagnostic diagnostic;

  EmpruntSuccess({@required this.diagnostic});

  @override
  List<Object> get props => [diagnostic];
}

class EmpruntError extends EmpruntState {}