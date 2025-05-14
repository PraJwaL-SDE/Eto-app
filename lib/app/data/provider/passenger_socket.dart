
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../core/utils/api_config.dart';

class PassengerSocket{
  late IO.Socket _socket;

  PassengerSocket({String serverUrl = ApiConfig.socketUrl}) {
    _socket = IO.io(
      serverUrl,
      IO.OptionBuilder()
          .setTransports(['websocket']) // Specify WebSocket transport
          .disableAutoConnect() // Prevent auto-connection
          .build(),
    );
    _socket.on('connect', (_) {
      print("Socket connected to server!");
    });

    // Listen for connection errors
    _socket.on('connect_error', (error) {
      print("Socket connection error: $error");
    });

    // Attempt to connect
    _socket.connect();
    print("Attempting to connect...");
  }

  /// Emits a driver selection event to the server.
  void selectDriver(String driverId) {
    _socket.emit('select-driver', {'driverId': driverId});
    print("emit select-driver");
  }
  // Stream<dynamic> listenDriver(){
  // // socket.on('accept-ride-request'
  // }
  //
  // Stream<dynamic> trackDriver(String driverId){
  // // socket.on('start-ride'
  // }

}