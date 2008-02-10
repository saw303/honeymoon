class ShoppingCart {

    String sessionId
    Customer customer
    LinkedList items
    Boolean sold = Boolean.FALSE

    static hasMany = [items: CartItem]

    static constraints = {
        sessionId(nullable:false, blank:false)
        sold(nullable:false)
        items(nullable:true)
        customer(nullable:true)
    }

}
