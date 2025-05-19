import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../core/utils/api_config.dart';

class DriverSocket {
  static final DriverSocket _instance = DriverSocket._internal();
  late IO.Socket _socket;

  factory DriverSocket() => _instance;

  DriverSocket._internal() {
    _socket = IO.io(
      ApiConfig.socketUrl,
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .build(),
    );

    _socket.on('connect', (_) {
      print("Socket connected to server!");
    });

    _socket.on('connect_error', (error) {
      print("Socket connection error: $error");
    });

    _socket.on('disconnect', (_) {
      print("Socket disconnected.");
    });

    _socket.connect();
  }

  /// Listen to events for a specific driver
  void listenToDriver(String driverId, String event, Function(dynamic) onEvent) {
    _socket.emit('join_driver', {'driver_id': driverId});

    _socket.on(event, (data) {
      onEvent(data); // Notify the caller about the event
    });

    print("Listening for $event events for driver $driverId");
  }


  /// Stop listening to driver events
  void stopListeningToDriver() {
    _socket.off('driver_event'); // Remove listener for driver-specific events
    print("Stopped listening to driver events.");
  }

  /// Send a message with a specific event name and data
  void sendMessage(String event, Map<String, dynamic> data) {
    _socket.emit(event, data);
    print("Message sent: Event - $event, Data - $data");
  }

  /// Disconnect from the socket
  void disconnect() {
    _socket.disconnect();
    print("Socket disconnected.");
  }
}
