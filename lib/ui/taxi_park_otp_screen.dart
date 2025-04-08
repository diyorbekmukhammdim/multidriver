import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class TaxiParkOtpScreen extends StatefulWidget {
  const TaxiParkOtpScreen({super.key});

  @override
  State<TaxiParkOtpScreen> createState() => _TaxiParkOtpScreenState();
}

class _TaxiParkOtpScreenState extends State<TaxiParkOtpScreen> {
  TextEditingController codeController = TextEditingController();
  final focusNode = FocusNode();
  final focusedBorderColor = Color(0xFFFFD900);
  final fillColor = Color(0xFFFFD900);
  bool enable = false;
  //final borderColor = Colors.green;
  final defaultPinTheme = PinTheme(
    width: 72,
    height: 71,
    textStyle: TextStyle(
        fontSize: 30,
        color: Colors.black,
        fontWeight: FontWeight.w700),
    decoration: BoxDecoration(
      color: Color(0x99EAE6E6),
      borderRadius: BorderRadius.circular(12),
      //border: Border.all(color: Colors),
    ),
  );

  @override
  void dispose() {
   codeController.dispose();
   focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GestureDetector(onTap: (){
                Navigator.pop(context);
              },child: Icon(Icons.arrow_back_ios)),
            ),
            SizedBox(
              height: 24,
            ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child:Text(
              'Введите код \nвашего таксопарка',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                  letterSpacing: 0
              ),
            ),
        ),
            SizedBox(
              height: 18,
            ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child:Text(
              'Введите уникальный четырехзначный код вашего таксопарка, чтобы войти в приложение',
              style: TextStyle(
                  fontWeight: FontWeight.w400, color: Color(0xCC828282)),
            ),
        ),
            SizedBox(height: 48),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child:Center(
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Pinput(
                  length: 4,
                  controller: codeController,
                  focusNode: focusNode,
                  defaultPinTheme: defaultPinTheme,
                  separatorBuilder: (index) => SizedBox(width: 16),
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  onCompleted: (pin) {
                    enable = true;
                    setState(() {

                    });
                  },
                  onChanged: (value) {
                    if(value.length <4){
                      enable = false;
                      setState(() {
                      });
                    }
                  },
                  cursor: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        //margin: EdgeInsets.only(bottom: 9),
                        width: 12,
                        height: 1,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      borderRadius: BorderRadius.circular(12),
                     // border: Border.all(color: focusedBorderColor),
                    ),
                  ),
                  submittedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      borderRadius: BorderRadius.circular(12),
                      //border: Border.all(color: focusedBorderColor),
                    ),
                  ),
                  errorPinTheme: defaultPinTheme.copyBorderWith(
                    border: Border.all(color: Colors.redAccent),
                  ),
                ),
              ),
            ),
        ),
            SizedBox(height: 48,),
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset('assets/image/car4.png',fit: BoxFit.cover,width: double.infinity,height: double.infinity,),
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 48,right: 24,left: 24),
                      height: 65,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: enable ? Color(0xFFFFD900) : Color(0xFFFFFBE5)
                      ),
                      child: Center(child: Text('Далее', style:TextStyle(fontWeight: FontWeight.w600, fontSize: 17,color: enable?Colors.black : Colors.white),)),
                    ),
                  ),
                ],
              ),
            )



          ],
        ),
      ),
    );
  }
}
