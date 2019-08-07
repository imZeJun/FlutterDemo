class Singleton {

  //单例对象。
  static Singleton _instance;

  //构造函数。
  Singleton._internal() {
    print("_internal");
  }

  static Singleton _getInstance() {
    //仅在 _instance 为空时才调用。
    if (_instance == null) {
      _instance = Singleton._internal();
    }
    return _instance;
  }

  //调用方法。
  void method() {
    print("method");
  }

  //1.通过 new Singleton() 调用。
  factory Singleton() => _getInstance();
  //2.通过 Singleton.instance 调用。
  static Singleton get instance => _getInstance();

}