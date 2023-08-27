import '../extensions/common_extensions.dart';

class AssetConstants {
  static final AssetConstants _instance = AssetConstants._internal();
  AssetConstants._internal();
  static AssetConstants get instance => _instance;

  String get book => "book".toPngLower;
  String get profileImage => "profile_image3".toPngLower;
  String get tabIcon => "tab_icon".toPngLower;
  String get tabIcon2 => "tab_icon2".toPngLower;
  String get tabIcon3 => "tab_icon3".toPngLower;
  String get tabIcon4 => "tab_icon4".toPngLower;
  String get tabIcon5 => "tab_icon5".toPngLower;
}
