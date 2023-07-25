part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    required this.fortuneReadingText,
  });

  final String fortuneReadingText;

  const HomeState.initial()
      : this(
          fortuneReadingText: '',
        );

  const HomeState.success({
    required String fortuneReadingText,
  }) : this(
          fortuneReadingText: fortuneReadingText,
        );

  @override
  List<Object?> get props => [
        fortuneReadingText,
      ];
}
