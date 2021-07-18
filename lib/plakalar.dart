class Plakalar{
    late int _id;
    late String _plakaadi;
    late int _ver;

    int get ver => _ver;

  set vermismi(int value) {
    _ver = value;
  }

  Plakalar(this._plakaadi,this._ver);
  Plakalar.withID(this._id,this._plakaadi,this._ver);

   int get id => _id;

  set id(int value) {
    _id = value;
  }

   String get plakaadi => _plakaadi;

  set plakaadi(String value) {
    _plakaadi = value;
  }

 Map <String ,dynamic> toMap(){
    var map = Map<String ,dynamic>();
    map["id"] = _id;
    map["plakaadi"] = _plakaadi;
    map["ver"] = _ver;
    return map;
 }
 Plakalar.toObj(Map <String,dynamic> obje){
    this._id = obje["id"];
    this._plakaadi = obje["plakaadi"];
    this._ver = obje["ver"];
 }
}