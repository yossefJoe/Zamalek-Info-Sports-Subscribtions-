class Subscription {
  final String gameName;
  final String fees;
  final String subscriptiondate;
  final String subscriptioncode;
  final String renewal;
  final String subscribername;

  Subscription({
    required this.gameName,
    required this.fees,
    required this.subscriptiondate,
    required this.subscriptioncode,
    required this.renewal,
    required this.subscribername,
  });

  Map<String, dynamic> toJson() => {
        'gamename': gameName,
        'fees': fees,
        'subscriptiondate': subscriptiondate,
        'subscriptioncode': subscriptioncode,
        'renewal': renewal,
        'subscribername': subscribername,
      };

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      gameName: json['gamename'] ?? '',
      fees: json['fees'] ?? '',
      subscriptiondate: json['subscriptiondate'] ?? '',
      renewal: json['renewal'] ?? '',
      subscriptioncode: json['subscriptioncode'] ?? '',
      subscribername: json['subscribername'] ?? '',
    );
  }
}

class User {
  final String userId;
  final String username;
  final String email;
  List<Subscription> subscriptions;

  User({
    required this.userId,
    required this.username,
    required this.email,
    required this.subscriptions,
  });

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'username': username,
        'email': email,
        'subscriptions': subscriptions.map((s) => s.toJson()).toList(),
      };

  factory User.fromJson(Map<String, dynamic> json) {
    var subscriptionsJson = json['subscriptions'] as List? ?? [];
    List<Subscription> subscriptions = subscriptionsJson
        .map((s) => Subscription.fromJson(s as Map<String, dynamic>))
        .toList();

    return User(
      userId: json['userId'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      subscriptions: subscriptions,
    );
  }
}
