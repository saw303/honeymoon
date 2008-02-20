class ShoppingCart {

    String sessionId
    Customer customer    
    Boolean sold = Boolean.FALSE
	List items

    static hasMany = [items: CartItem]

    static constraints = {
        sessionId(nullable:false, blank:false)
        sold(nullable:false)
        items(nullable:true)
        customer(nullable:true)
    }

    public String toString() {
        return "Warenkorb von Session ${sessionId}, ${items.size()} Einträge, ${sold ? 'Verkauft' : 'noch in Bearbeitung'}, Kunde: ${customer != null ? customer : 'unbekannt'}";
    }

}
