package ch.silviowangler.honeymoon


class GiftItem {
  static belongsTo = [category: GiftItemCategory]

  String name
  String description
  String image
  Boolean active = Boolean.TRUE;

  static constraints = {
    name(nullable: false, blank: false, length: 1..50)
    description(nullable: false, blank: false, length: 1..255)
    image(nullable: true, blank: true, length: 0..512)
    active(nullabe: false)
  }

  String toString() {
    return "Wunscheintrag: ${name}, Status: ${active ? 'aktiv' : 'inaktiv'}"
  }
}
