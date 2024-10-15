import 'dart:math';

import 'package:flutter/material.dart';

class Person <T>{ //типизирован определенным типом / универсальный параметр
  T id;
  String name;
  Person (this.id, this.name);
}
void main() {
Person t = Person(134, "Tom");
print(t.id);
Person b = Person("324", "Bob");
print(b.id);
Person s = Person(123, "Sam");
print(s.id.runtimeType);

Person<String> bob = Person<String>("324", "Bob");
print(bob.id.runtimeType);
Person<int> sam = Person<int>(123, "Sam");
print(sam.id.runtimeType);

int x = 20;
log(x);
x = 34;
log(x);
String name = "Tom";
log(name);

Account ac1 = Account(1, 1000);
Account ac2 = Account(2, 2000);

Transaction tr1 = Transaction(ac2, ac1, 3000);
tr1.execute();
}

void log<T>(T a){
  print("${DateTime.now()} a = $a");
}

class Account {
  int id;
  int sum;
  Account(this.id, this.sum);
}

class Transaction <T extends Account>{
  T fromAc;
  T toAc;
  int sum;
  Transaction(this.fromAc, this.toAc, this.sum);

  void execute(){
    if(fromAc.sum>sum){
      fromAc.sum-=sum;
      toAc.sum+=sum;
      print("Счет ${fromAc.id}: ${fromAc.sum}\$ \nСчет ${toAc.id}: ${toAc.sum}\$");
    }
    else{
      print("Недостаточно денег на счете ${fromAc.id}");
    }
  }
}

