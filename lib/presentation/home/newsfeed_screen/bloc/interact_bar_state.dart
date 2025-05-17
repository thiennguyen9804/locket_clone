part of 'interact_bar_cubit.dart';

@immutable
sealed class InteractBarState {}

class InteractBarLoading extends InteractBarState {}
class MyInteractBarState extends InteractBarState {}
class OthersInteractBarState extends InteractBarState {}
class NoInteractBar extends InteractBarState {}