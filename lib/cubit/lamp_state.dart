part of 'lamp_cubit.dart';

@immutable
sealed class LampState {}

final class LampInitial extends LampState {}
final class turnOffMyLamp extends LampState {}
final class turnOnMyLamp extends LampState {}
final class fetchData extends LampState {}
final class loadingData extends LampState {}
