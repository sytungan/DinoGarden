import 'package:dinogarden/manage/mqtt/MQTTManager.dart';
import 'package:provider/provider.dart';

MQTTManager _manager = new MQTTManager();

void _configureAndConnect() async {
  // TODO: Use UUID
  String osPrefix = 'Flutter_Android';
  _manager.initializeMQTTClient(identifier: osPrefix);
  await _manager.connect();
  _manager.subScribeTo('dinhkhanh412/feeds/light');
  _manager.subScribeTo('dinhkhanh412/feeds/light2');
}
