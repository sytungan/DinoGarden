class DeviceAuto {
  final String name;
  final String on;
  final String off;
  final String hOn;
  final String hOff;
  final String status;

  DeviceAuto(this.name, this.on, this.off, this.hOn, this.hOff, this.status);

  DeviceAuto.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        on = json['on'],
        off = json['off'],
        hOn = json['hon'],
        hOff = json['hof'],
        status = json['status'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'on': on,
        'off': off,
        'ho': hOn,
        'hof': hOff,
        'status': status,
        'fo': "23:8:10",
      };
}
