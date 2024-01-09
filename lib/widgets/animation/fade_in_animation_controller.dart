import 'package:get/get.dart';
import '../formulaireClient/form_page.dart';
class FadeInAnimationController extends GetxController{
  static FadeInAnimationController get find => Get.find();


  RxBool animate = false.obs;
  Future startSplashAnimation() async{
    await Future.delayed(Duration(milliseconds: 1000));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 4000));
    animate.value = false;
    await Future.delayed(const Duration(milliseconds: 2500));
    Get.offAll(()=>FormPage());
  }

  Future startLoginAnimation() async{
    await Future.delayed(Duration(milliseconds: 500));
    animate.value = true;
  }
  Future startAccueilAnimation() async{
    await Future.delayed(Duration(milliseconds: 500));
    animate.value = true;
  }
  Future startUserAnimation() async{
    await Future.delayed(Duration(milliseconds: 500));
    animate.value = true;
  }

}