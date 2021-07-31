class LogLine {
  String text;
  String time;
  LogLine(this.text, this.time);

  LogLine.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        time = json['time'];
  Map<String, dynamic> toJson() => {
        'text': text,
        'time': time,
      };
}
