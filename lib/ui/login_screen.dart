import 'package:flutter/material.dart';
import 'package:multidriver/ui/verify_sms_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  bool enable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
            ),
            Row(
              children: [
                Image.asset('assets/image/lanugage.png'),
                SizedBox(
                  width: 4,
                ),
                PopupMenuButton(
                    child: Row(
                      children: [
                        Text('Русский'),
                        Icon(Icons.keyboard_arrow_down_outlined)
                      ],
                    ),
                    itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 'rus',
                            child: Text('Русский'),
                          ),
                        ])
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              'Авторизация \nв приложении',
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.w700, letterSpacing: 0),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              'Введите номер телефона, чтобы мы могли идентифицировать ваши данные и подключить к таксопарку',
              style: TextStyle(
                  fontWeight: FontWeight.w400, color: Color(0xCC828282)),
            ),
            SizedBox(height: 48),
            TextField(
                onChanged: (String e) {
                  if (e.length >= 4) {
                    enable = true;
                    setState(() {});
                  } else {
                    enable = false;
                    setState(() {});
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  hintText: 'Введите номер телефона',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w500, color: Color(0xCC828282)),
                )),
            Spacer(),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isChecked = !isChecked; // Toggle the checkbox state
                    });
                  },
                  child: Container(
                    width: 14.0, // Width of the circle
                    height: 14.0, // Height of the circle
                    decoration: BoxDecoration(
                      color: isChecked ? Color(0xFFFFD900) : Colors.white,
                      // Set the background color
                      borderRadius: BorderRadius.circular(114.0),
                      // Make it circular
                      border: Border.all(
                        color: Color(0xFFBEBEBE), // Border color
                        width: 1.0,
                      ),
                    ),
                    child: isChecked
                        ? Icon(
                            Icons.check,
                            color: Colors.black,
                            size: 10.0,
                          )
                        : null, // Show checkmark when checked
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Flexible(
                  child: Text(
                    'Я соглашаюсь с условиями публичной оферты и даю свое согласие на обработку и использование моих персональных данных',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10),
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                if(enable && isChecked) {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => VerifySmsScreen()));
                }
              },
              child: Container(
                margin: EdgeInsets.only(top: 24, bottom: 24),
                height: 65,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: enable && isChecked ? Color(0xFFFFD900) : Color(0xFFFFFBE5)),
                child: Center(
                    child: Text(
                  'Далее',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: enable && isChecked ? Colors.black : Colors.white),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
