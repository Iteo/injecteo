import 'package:di_example/domain/user/user_info.dart';
import 'package:injecteo/injecteo.dart';

import '../../core/di/injection_modules.dart';

@inject
@userInjectionModule
class UserInfoProvider {
  UserInfoProvider(
    this.userInfo,
  );

  final UserInfo userInfo;

  @factoryMethod
  static Future<UserInfoProvider> create(UserDataSource userDataSource) async {
    // some additional async work that takes time
    final userInfo = await userDataSource.fetch();
    return UserInfoProvider(userInfo);
  }
}

@singleton
@userInjectionModule
class UserDataSource {
  Future<UserInfo> fetch() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return UserInfo(
      "John",
      "Flutter Developer",
    );
  }
}
