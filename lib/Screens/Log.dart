class Log {
   final List<dynamic> data;
   final String status;

  Log({this.data, this.status});

  factory Log.fromJson(Map<String, dynamic> json) {
    var temp;
    if(json['data'] == null){
      temp = [];
    }
    else{
      temp =json['data']['history'].toList();
    }
    return Log(
        data: temp, status: json['status']);
  }
}