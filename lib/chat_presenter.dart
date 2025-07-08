import 'package:em_chat_uikit/chat_uikit_service/chat_uikit_service.dart';
import 'package:em_chat_uikit/sdk_service/chat_sdk_define.dart';
import 'package:im_flutter_sdk/im_flutter_sdk.dart';

class ChatPresenter {
  void initSDK() async {
    await ChatUIKit.instance
        .init(options: EMOptions.withAppKey("easemob-demo#support")


    );
  }


}
