
class Users {
  String accountId;

  Users(this.accountId);

  Map<String, dynamic> toJson() => {
    'Account Number': accountId
  };
}
