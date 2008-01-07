class GiftItem
{
  String name
  String description
  String image
  Integer price
  Boolean active = Boolean.TRUE;
  
  /*
  Allenfalls soll ein Wunschbucheintrag einem Thema zugehören. D.h. dass es Themen wie 'Las Vegas', 'New York', etc. vorhanden sind
  und die Wunschbucheinträge danach gefiltert werden können.
  /*

  // static hasMany = []
  // static belongsTo = []
  static constraints = {
      name(nullable:false, blank:false, length:1..50)
      description(nullable:false, blank:false, length: 1..255)
      image(nullable:true, blank:true, length: 0..255)
      price(nullable:false, blank:false)
  }

  String toString ()
  {
    return "GiftItem ${id}"
  }
}
