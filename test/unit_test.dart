import 'package:flutter_test/flutter_test.dart';
import 'package:to_do/utils/utils.dart';
void main(){
  test('increase id',(){
    int result = increaseID(1);
    print(result);
    expect(result, 2);
  });

  test('DateString', (){
    String result = getDateTimeString();
    print(result);
    expect(result, '2-11-2022');
  });

  test('DifferenceDate',(){
    int result = differenceDate('2022-10-31 20:42:14.368577');
    print(result);
    expect(result, 2);
  });
}