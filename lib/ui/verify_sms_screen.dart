import 'package:flutter/material.dart';
import 'package:multidriver/ui/taxi_park_otp_screen.dart';

class VerifySmsScreen extends StatefulWidget {
  const VerifySmsScreen({super.key});

  @override
  State<VerifySmsScreen> createState() => _VerifySmsScreenState();
}

class _VerifySmsScreenState extends State<VerifySmsScreen> {
bool enable = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
              ),
              GestureDetector(onTap:(){
                Navigator.pop(context);
              },child: Icon(Icons.arrow_back_ios)),
              SizedBox(
                height: 24,
              ),
              Text(
                'Подтвердите ваш \nномер телефона',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                    letterSpacing: 0
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                'Введите код подтверждения, отправленный на ваш номер. Отправить код еще раз через: 00:58',
                style: TextStyle(
                    fontWeight: FontWeight.w400, color: Color(0xCC828282)),
              ),
              SizedBox(height: 48),
              TextField(
                onChanged: (String e){
                  if(e.length >= 4) {
                    enable = true;
                    setState(() {
                    });
                  } else{
                    enable = false;
                    setState(() {

                    });
                  }
                },
                  decoration: InputDecoration(
                    border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    hintText: 'Введите код из СМС',
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w500, color: Color(0xCC828282)),
                  )),
              Spacer(),

              GestureDetector(
                onTap: (){
                  if(enable) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TaxiParkOtpScreen()));
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(top: 24,bottom: 24),
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
        ),
      ),
    );
  }
}
