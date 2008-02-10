class CartItem {

    Integer amount
    GiftItem giftItem

    static constraints = {
        amount(nullable: false, blank:false)
    }

}
