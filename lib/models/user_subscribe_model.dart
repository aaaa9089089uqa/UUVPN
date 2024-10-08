import 'package:uuvpn/constant/app_strings.dart';
import 'package:uuvpn/entity/user_subscribe_entity.dart';
import 'package:uuvpn/models/base_model.dart';
import 'package:uuvpn/service/user_service.dart';
import 'package:uuvpn/utils/shared_preferences_util.dart';

class UserSubscribeModel extends BaseModel {
  UserSubscribeEntity? _userSubscribeEntity;

  final UserService _userService = UserService();

  UserSubscribeEntity? get userSubscribeEntity => _userSubscribeEntity;

  Future<bool> getUserSubscribe({bool forceRefresh = false}) async {
    bool result = false;

    // Map<String, dynamic>? data = await SharedPreferencesUtil.getInstance() ?.getMap(AppStrings.userSubscribe);
    Map<String, dynamic>? data;
    if (data == null || data.isEmpty || forceRefresh) {
      setUserSubscribeEntity(await _userService.userSubscribe());
    } else {
      _userSubscribeEntity = UserSubscribeEntity.fromMap(data);
    }

    notifyListeners();

    result = true;

    return result;
  }

  setUserSubscribeEntity(UserSubscribeEntity? userSubscribeEntity) {
    _userSubscribeEntity = userSubscribeEntity;

    _saveUserSubscribe();
  }

  _saveUserSubscribe() async {
    SharedPreferencesUtil? sharedPreferencesUtil =
        SharedPreferencesUtil.getInstance();

    await sharedPreferencesUtil?.setMap(
        AppStrings.userSubscribe, _userSubscribeEntity?.toMap());
  }
}
