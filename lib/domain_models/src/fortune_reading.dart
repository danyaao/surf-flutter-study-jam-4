import 'package:equatable/equatable.dart';

class FortuneReading extends Equatable {
  const FortuneReading({
    required this.text,
  });

  final String text;

  @override
  List<Object?> get props => [
        text,
      ];
}
