class FortuneReadingRM {
  const FortuneReadingRM({
    required this.text,
  });

  final String text;

  static FortuneReadingRM fromJson(Map<String, dynamic> json) =>
      FortuneReadingRM(
        text: json['reading'] as String,
      );
}
