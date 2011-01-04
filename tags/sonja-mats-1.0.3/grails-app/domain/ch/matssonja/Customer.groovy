package ch.matssonja

class Customer {

	static belongsTo = [cart: ShoppingCart]
	
    String firstName
    String lastName
    String email
    String adressLine
    String postCode
    String city

    static constraints = {
        firstName(nullable:false, size:1..20, blank:false)
        lastName(nullable:false, size:1..30, blank:false)
        email(nullable:false, email:true, blank:false)
        adressLine(nullable:false, size:1..50, blank:false)
        postCode(nullable:false, size:1..10, blank:false)
        city(nullable:false, size:1..30, blank:false)
    }

    public String toString() {
        return "${firstName} ${lastName}, ${email}, ${postCode} ${city}"
    }

}
