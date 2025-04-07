import 'package:flutter/cupertino.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
      ),
      child: Column(
        children: [
          Image.network('https://user-images.githubusercontent.com/24841626/43708951-e86d62b2-996b-11e8-9d2c-ee2599db49e7.png'),
          Text('Greska se pojavila', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0), ),
          SizedBox(height: 10.0,),
          Text('Test')
        ],
      ),
    );
  }
}
