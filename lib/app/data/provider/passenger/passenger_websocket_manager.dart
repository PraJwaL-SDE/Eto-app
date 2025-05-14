import 'package:eto_ride/app/data/storage/passenger_ride_storage.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../../core/utils/api_config.dart';

class PassengerWebsocketManager {
  late IO.Socket _socket;

  /// Starts the WebSocket service and handles errors.
  Future<void> startService() async {
    try {
      _socket = IO.io(
        ApiConfig.socketUrl,
        IO.OptionBuilder()
            .setTransports(['websocket']) // Use WebSocket transport
            .setReconnectionAttempts(5) // Limit the number of reconnection attempts
            .setReconnectionDelay(1000) // Delay between reconnections (ms)
            .build(),
      );

      _initializeListeners();
    } catch (e) {
      print("Error starting WebSocket service: $e");
    }
  }

  /// Initializes event listeners for the WebSocket connection.
  void _initializeListeners() {
    _socket.onConnect((_) {
      print("WebSocket connected: ${_socket.id}");
    });

    _socket.onDisconnect((_) {
      print("WebSocket disconnected.");
    });

    _socket.onConnectError((data) {
      print("WebSocket connection error: $data");
    });

    _socket.onError((data) {
      print("WebSocket error: $data");
    });

    _socket.onReconnectAttempt((_) {
      print("WebSocket attempting to reconnect...");
    });

    _socket.onReconnectFailed((_) {
      print("WebSocket reconnection failed.");
    });

    _socket.onReconnect((_) {
      print("WebSocket successfully reconnected.");
    });

    _socket.on('accept-ride-request',(data)async{
      var servicemodel = await PassengerRideStorage().getService();
      if(servicemodel!=null){
        servicemodel.driverSocketId = data['sender_id'];
        PassengerRideStorage().setService(servicemodel);
      }

    });
  }

  /// Emits a message through the WebSocket.
  void sendMessage(String event, dynamic data) {
    if (_socket.connected) {
      _socket.emit(event, data);
      print("Message sent: $event -> $data");
    } else {
      print("Cannot send message, WebSocket is not connected.");
    }
  }

  /// Disposes the WebSocket connection.
  void dispose() {
    _socket.disconnect();
    print("WebSocket connection closed.");
  }
}
