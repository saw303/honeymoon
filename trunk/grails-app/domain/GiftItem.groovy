class GiftItem
{	
  static belongsTo = [category: Category]
  
  String name
  String description
  String image
  Integer price
  Boolean active = Boolean.TRUE;

  static constraints = {
      name(nullable:false, blank:false, length:1..50)
      description(nullable:false, blank:false, length: 1..255)
      image(nullable:true, blank:true, length: 0..255)
	  active(nullabe:false)
      price(nullable:false, blank:false, range:0..1000000)	  
  }

  String toString ()
  {
    return "Wunscheintrag: ${name}, ${price}. Status: ${active ? 'aktiv' : 'inaktiv'}"
  }
}
