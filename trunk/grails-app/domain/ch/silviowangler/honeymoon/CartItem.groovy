package ch.silviowangler.honeymoon

class CartItem {

  static belongsTo = [giftItem: GiftItem]

  Integer amount

  static constraints = {
    amount(nullable: false)
  }
}
