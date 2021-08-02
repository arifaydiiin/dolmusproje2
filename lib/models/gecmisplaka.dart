class GecmisPlaka {
  late String _plakaadi;
  late String _time;
  late String _lasttime;

  String get plakaadi => _plakaadi;

  set plakaadi(String value) {
    _plakaadi = value;
  }

  String get time => _time;

  set time(String value) {
    _time = value;
  }

  String get lasttime => _lasttime;

  set lasttime(String value) {
    _lasttime = value;
  }

  Map<String, Object?> toMap() {
    var map = Map<String, dynamic>();
    map["plakaadi"] = _plakaadi;
    map["time"] = _time;
    map["lasttime"] = _lasttime;
    return map;
  }

  GecmisPlaka(this._lasttime, this._plakaadi, this._time);

  GecmisPlaka.toObj(Map<String, dynamic> obje) {
    this._plakaadi = obje["plakaadi"];
    this._time = obje["time"];
    this._lasttime = obje["lasttime"];
  }
}
