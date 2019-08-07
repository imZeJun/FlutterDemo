typedef void EventCallback(arg);

class EventBus {

  //私有构造函数。
  EventBus._internal();

  //保存单例。
  static EventBus _singleton = new EventBus._internal();

  //工厂构造函数。
  factory EventBus() => _singleton;

  //保存事件订阅队列。
  var _listeners = Map<Object, List<EventCallback>>();

  void add(eventName, EventCallback f) {
    if (eventName == null || f == null) {
      return;
    }
    _listeners[eventName] ??= List<EventCallback>();
    _listeners[eventName].add(f);
  }

  void remove(eventName, [EventCallback f]) {
    var list = _listeners[eventName];
    if (eventName == null || list == null) {
      return;
    }
    if (f == null) {
      _listeners[eventName] = null;
    } else {
      list.remove(f);
    }
  }

  void notice(eventName, [arg]) {
    var list = _listeners[eventName];
    if (list == null) {
      return;
    }
    int len = list.length - 1;
    for (var i = len; i > -1; i--) {
      list[i](arg);
    }
  }
}

var bus = new EventBus();