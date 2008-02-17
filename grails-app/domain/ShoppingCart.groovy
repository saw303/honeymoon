class ShoppingCart {

    String sessionId
    Customer customer
    LinkedList items = new LinkedList()
    Boolean sold = Boolean.FALSE

    static hasMany = [items: CartItem]

    static constraints = {
        sessionId(nullable:false, blank:false)
        sold(nullable:false)
        items(nullable:true)
        customer(nullable:true)
    }

    public String toString() {
        return "Warenkorb von Session ${sessionId}, ${items.size()} Eintr�ge, ${sold ? 'Verkauft' : 'noch in Bearbeitung'}, Kunde: ${customer != null ? customer : 'unbekannt'}";
    }

}
