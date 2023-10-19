typedef T InstanceCreator<T>();

class DependencyInjector {
  DependencyInjector._();

  static final instance = DependencyInjector._();

  factory DependencyInjector() => instance;

  final _instanceMap = Map<Type, _InstanceGenerator<Object>>();

  //register
  void register<T extends Object>(InstanceCreator<T> instance,
      {bool isSingleton = false}) {
    _instanceMap[T] = _InstanceGenerator(instance, isSingleton);
  }

  //get
}

class _InstanceGenerator<T> {
  T? _instance;
  bool _isFirstGet = false;

  final InstanceCreator<T> _instanceCreator;
  _InstanceGenerator(this._instanceCreator, bool isSingleton)
      : _isFirstGet = isSingleton;

  T? getInstance() {
    if (_isFirstGet) {
      _instance = _instanceCreator();
      _isFirstGet = false;
    }
    return _instance != null ? _instance : _instanceCreator();
  }
}
