class GiftItem
{
  String name
  String description
  String image
  Integer price
  Boolean active = Boolean.TRUE;
  
  static belongsTo = [category:Category]

  static constraints = {
      name(nullable:false, blank:false, length:1..50)
      description(nullable:false, blank:false, length: 1..255)
      image(nullable:true, blank:true, length: 0..255)
      price(nullable:false, blank:false, range:0..1000000)
  }

  String toString ()
  {
    return "Wunscheintrag: ${name}, ${price}. Status: ${active ? 'aktiv' : 'inaktiv'}"
  }
}
