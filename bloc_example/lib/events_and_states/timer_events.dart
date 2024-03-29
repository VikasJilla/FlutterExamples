import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class TimerEvent extends Equatable{
  TimerEvent([List props = const[]]):super(props);
}

class Start extends TimerEvent{

  final int duration;
  
  Start({this.duration}) : super([duration]);

  @override
  String toString()=>'started with duration $duration';

}

class Pause extends TimerEvent {
  @override
  String toString() => "Pause";
}

class Resume extends TimerEvent {
  @override
  String toString() => "Resume";
}

class Reset extends TimerEvent {
  @override
  String toString() => "Reset";
}

class Tick extends TimerEvent {
  final int duration;

  Tick({@required this.duration}) : super([duration]);

  @override
  String toString() => "Tick { duration: $duration }";
}
