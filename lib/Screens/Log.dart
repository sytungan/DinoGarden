class Log {
   final List<dynamic> data;
   final String status;

  Log({this.data, this.status});

  factory Log.fromJson(Map<String, dynamic> json) {
    return Log(
        data: json['data']['history'].toList(), status: json['status']);
  }
}