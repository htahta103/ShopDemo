import 'package:get/get.dart';
import 'package:progress_dialog/progress_dialog.dart';

class LoadingUtils{
  static ProgressDialog pr;

  static Future show({String message = 'Loading...'}) async {
    pr = ProgressDialog(Get.overlayContext, isDismissible: false);
    pr.style(message: message);
    await pr.show();
  }

  static Future hide() async {
     try {
      if(pr?.isShowing() == true)
        await pr.hide();

      pr = null;
    } catch(e) {
      
    }
  }
}