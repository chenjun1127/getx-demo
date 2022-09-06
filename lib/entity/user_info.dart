class UserInfo {
  String? userName;
  int? age;
  String? tel;

  UserInfo(this.userName, this.age, this.tel);

  @override
  String toString() {
    return 'UserInfo{userName: $userName, age: $age, tel: $tel}';
  }
}
