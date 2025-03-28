import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String lampImg; // 램프 이미지

  @override
  void initState() {
    super.initState();
    lampImg = 'lamp_off.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert를 이용한 메시지 출력', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/$lampImg', width: 300),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () => lampOff(),
                    child: Text('끄기'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () => lampOn(),
                    child: Text('켜기'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // -------- 램프 켜기 Function --------

  lampOn() {
    if (lampImg == 'lamp_off.png') {
      lampImg = 'lamp_on.png';
    } else {
      _showDialog(context);
    }
    setState(() {});
  }

  // ------- 램프 끄기 Function --------

  lampOff() {
    if (lampImg == 'lamp_on.png') {
      lampImg = 'lamp_off.png';
    } else {
      _showDialog(context);
    }
    setState(() {});
  }

  //------- 램프 상태 경고 Dialog Function --------
  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('경고'),
          content: Text(
            lampImg == 'lamp_on.png' ? '현재 램프가 켜진 상태입니다.' : '현재 램프가 꺼진 상태임니다.',
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);

                    //------ 램프 상태 변환 Dialog Function -------
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            lampImg == 'lamp_on.png' ? '램프 끄기' : '램프 켜기',
                          ),
                          content: Text(
                            lampImg == 'lamp_on.png'
                                ? '램프를 끄겠습니까?'
                                : '램프를 키겠습니다?',
                          ),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    if (lampImg == 'lamp_on.png') {
                                      lampImg = 'lamp_off.png';
                                    } else if (lampImg == 'lamp_off.png') {
                                      lampImg = 'lamp_on.png';
                                    }
                                    setState(() {});
                                  },
                                  child: Text('네 '),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('아니요'),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    '네 알겠습니다.',
                    style: TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
