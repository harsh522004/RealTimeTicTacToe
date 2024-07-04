class Player {
  final String nickname;
  final String playerType;
  final String socketId;
  final double points;

  Player({
    required this.nickname,
    required this.playerType,
    required this.socketId,
    required this.points,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nickname': nickname,
      'playerType': playerType,
      'socketId': socketId,
      'points': points,
    };
  }

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      nickname: map['nickname'] ?? '',
      socketId: map['socketID'] ?? '',
      points: map['points']?.toDouble() ?? 0.0,
      playerType: map['playerType'] ?? '',
    );
  }
}
