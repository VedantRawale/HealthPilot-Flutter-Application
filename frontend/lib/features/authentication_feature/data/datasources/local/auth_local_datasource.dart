import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthLocalDataSource {
  // Singleton instance
  static final AuthLocalDataSource _instance = AuthLocalDataSource._internal();

  // Secure storage instance (you can customize the options here if needed)
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  // Private named constructor
  AuthLocalDataSource._internal();

  // Factory constructor to return the same instance every time
  factory AuthLocalDataSource() {
    return _instance;
  }

  // Methods for saving, retrieving, and clearing auth data
  Future<void> saveAuthData({
    required String accessToken,
    required String refreshToken,
    required String userId,
    required String name,
  }) async {
    await _secureStorage.write(key: 'accessToken', value: accessToken);
    await _secureStorage.write(key: 'refreshToken', value: refreshToken);
    await _secureStorage.write(key: 'userId', value: userId.toString());
    await _secureStorage.write(key: 'name', value: name);
  }

  Future<String> getAccessToken() async {
    final accessToken = await _secureStorage.read(key: 'accessToken');
    if (accessToken == null) {
      throw Exception("Access token not found");
    }
    return accessToken;
  }

  Future<String> getUserName() async {
    final name = await _secureStorage.read(key: 'name');
    if (name == null) {
      throw Exception("Name not found");
    }
    return name;
  }

  Future<String> getRefreshToken() async {
    final refreshToken = await _secureStorage.read(key: 'refreshToken');
    if (refreshToken == null) {
      throw Exception("Refresh token not found");
    }
    return refreshToken;
  }

  Future<String> getUserId() async {
    final userId = await _secureStorage.read(key: 'userId');
    if (userId == null) {
      throw Exception("User ID not found");
    }
    return userId;
  }

  Future<void> clearAuthData() async {
    await _secureStorage.deleteAll();
  }
}
