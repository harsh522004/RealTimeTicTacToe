import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketClient {
  // variable
  IO.Socket? socket; // can be null
  static SocketClient? _instance;

  // private constuctor
  SocketClient._internal() {
    socket = IO.io('http://192.168.29.54:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket!.connect();
  }

  // static getter method name "instance"
  static SocketClient get instance {
    _instance ??= SocketClient._internal();
    return _instance!;
  }
}
