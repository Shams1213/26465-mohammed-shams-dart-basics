// Student: Shams Alola Mohammed
// Reg no: 26465
const String regNo = '26465';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int momoFee(int amount) {
  // by SAM
  if (amount <= 0) return -1;
  if (amount > 150000) return 1500;
  if (amount > 10000) return 250;
  if (amount > 1000) return 100;
  return 20;
}

String formatRwf(int amount) {
  // by SAM
  if (amount == 0) return '0 RWF';
  bool negative = amount < 0;
  String digits = negative ? (-amount).toString() : amount.toString();
  String grouped = '';
  int count = 0;
  int idx = digits.length - 1;
  while (idx >= 0) {
    if (count > 0 && count % 3 == 0) {
      grouped = ',' + grouped;
    }
    grouped = digits[idx] + grouped;
    count++;
    idx--;
  }
  if (negative) {
    grouped = '-' + grouped;
  }
  return '$grouped RWF';
}

bool isValidPin(String pin) {
  // by SAM
  if (pin.length != 5) return false;
  if (pin == '12345') return false;
  const String digits = '0123456789';
  bool allSame = true;
  int idx = 0;
  while (idx < pin.length) {
    if (!digits.contains(pin[idx])) return false;
    if (pin[idx] != pin[0]) {
      allSame = false;
    }
    idx++;
  }
  return !allSame;
}

int sendMoney(int balance, int amount) {
  // by SAM
  int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int updatedBalance = balance - amount - fee;
  print('Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). New balance: ${formatRwf(updatedBalance)}');
  return updatedBalance;
}

int buyAirtime(int balance, int amount) {
  // by SAM
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid airtime amount');
    return balance;
  }
  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int updatedBalance = balance - amount;
  print('Bought ${formatRwf(amount)} airtime. New balance: ${formatRwf(updatedBalance)}');
  return updatedBalance;
}

void main() {
  // by SAM
  print('Reg no: $regNo | D = $d | T = $t');

  print(isValidPin('12345'));
  print(isValidPin('77777'));
  print(isValidPin('4821'));
  print(isValidPin('48a21'));
  print(isValidPin('4821$d'));

  int balance = 20000 + t * 500;
  print(formatRwf(balance));

  int transferAmount = (d + 1) * 3000;
  int step = 0;
  while (step < 3) {
    balance = sendMoney(balance, transferAmount);
    step++;
  }
  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  print('Final balance: ${formatRwf(balance)}');

  print(formatRwf(0)); // 0 RWF
  print(formatRwf(-5000)); // -5,000 RWF
  print(formatRwf(1250000)); // 1,250,000 RWF
  print(isValidPin('00000')); // false
  print(isValidPin('54321')); // true
  print(isValidPin('12 34')); // false (spaces might break a naive digit check)
}
