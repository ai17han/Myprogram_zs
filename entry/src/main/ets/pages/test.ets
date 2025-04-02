class parent{
  age : number = 0;

  constructor() {
  }
  public add(){

  }
}

class child extends parent{
  a: number = 0;
  constructor() {
    super()
  }

  public add(){

  }
}

class Person {
  name: string;

  constructor(name: string) {
    this.name = name;
  }

  // 实例方法
  greet(): void {
    console.log(`Hello, my name is ${this.name}`);
  }

  // 静态方法，通过显式传递对象访问实例成员
  static greetPerson(person: Person): void {
    console.log(`Static greeting to ${person.name}`);
    person.greet(); // 也可以调用实例方法
  }
}

// 使用
let john = new Person("John");
Person.greetPerson(john); // 通过静态方法访问实例成员