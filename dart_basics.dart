// Student: Shams Alola Mohammed
// Reg no: 26465
const String regNo = '26465';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int countVowels(String text) {
  // by SAM
  const String vowels = 'aeiou';
  int total = 0;
  int pos = 0;
  while (pos < text.length) {
    if (vowels.contains(text[pos].toLowerCase())) {
      total++;
    }
    pos++;
  }
  return total;
}

String initials(String fullName) {
  // by SAM
  String out = '';
  bool newWord = true;
  int k = 0;
  while (k < fullName.length) {
    String ch = fullName[k];
    if (ch == ' ') {
      newWord = true;
    } else {
      if (newWord) {
        out += ch.toUpperCase() + '.';
      }
      newWord = false;
    }
    k++;
  }
  return out;
}

void drawTriangle(int height) {
  // by SAM
  int row = 1;
  while (row <= height) {
    String symbol = (row % 2 == 1) ? '*' : '#';
    String line = '';
    int s = 0;
    while (s < height - row) {
      line += ' ';
      s++;
    }
    int c = 0;
    while (c < row) {
      line += symbol;
      c++;
    }
    print(line);
    row++;
  }
}

int momoFee(int amount) {
  // by SAM
  if (amount <= 0) return -1;
  if (amount > 150000) return 1500;
  if (amount > 10000) return 250;
  if (amount > 1000) return 100;
  return 20;
}

String maskPhone(String phone) {
  // by SAM
  if (phone.length != 10) return 'INVALID';
  String masked = '';
  int idx = 0;
  while (idx < phone.length) {
    if (idx < 3 || idx >= phone.length - 2) {
      masked += phone[idx];
    } else {
      masked += '*';
    }
    idx++;
  }
  return masked;
}

void main() {
  // by SAM
  print('Reg no: $regNo | D = $d | T = $t');
  const String myName = 'Shams Alola Mohammed';
  print('$myName has ${countVowels(myName)} vowels');
  print(initials(myName));
  print(initials(' ana uwase '));
  print(initials(' '));

  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  const String phone = '0788123456';
  int sumFees = 0;
  int i = 1;
  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    sumFees += fee;
    print('Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone(phone)}');
    i++;
  }
  print('Total fees: $sumFees RWF');
}
