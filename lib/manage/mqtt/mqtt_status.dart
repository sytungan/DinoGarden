import 'package:dinogarden/manage/mqtt/MQTTAppState.dart';

String prepareStateMessageFrom(MQTTAppConnectionState state) {
  switch (state) {
    case MQTTAppConnectionState.connected:
      return 'Connected';
    case MQTTAppConnectionState.connecting:
      return 'Connecting';
    case MQTTAppConnectionState.disconnected:
      return 'Disconnected';
    case MQTTAppConnectionState.connectedSubscribed:
      return 'Subscribed';
    case MQTTAppConnectionState.connectedUnSubscribed:
      return 'Unsubscribed';
  }
}
