class Config {
  //在android端, 会将本地地点映射为10.0.2.2, 127.0.0.1代表的是android模拟器本身
  static const String baseUrl = "http://10.0.2.2:3000";
  //连接超时时间
  static const int connectTimeout = 30000;
  //接收数据超时时间
  static const int receiveTimeout = 3000;
}