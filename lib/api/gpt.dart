import 'package:auraro_chat/utils/http.dart';

class GptApi {
  // 测试
  static get() async {
    var t = await Http.get(
      '/gpt/get',
    ) as String;
  }

  // 发送输入的文字
  static send(String message) async {
    var t = await Http.post('/gpt/send', {message: message});
    return t;
  }
}
