class GiftItem
{
  String name
  String description
  String image
  Integer price
  Boolean active = Boolean.TRUE;

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
