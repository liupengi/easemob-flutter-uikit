import 'package:em_chat_uikit/chat_uikit.dart';
import 'package:im_flutter_sdk/im_flutter_sdk.dart';

class ChatPresenter {
  void initSDK() async {
    await ChatUIKit.instance
        .init(options: EMOptions(appKey: 'easemob-demo#support'));



  }


}
