class Category {

	String name
	Integer alignment
	
	static hasMany = [ giftItems : GiftItem ]
	
	static constraints = {
		name(nullable:false, blank:false, size:1..100)
		alignment(nullable:false, blank:false, unique:true, range:1..100)
	}
	
	public String toString() {
		return "Kategorie: ${name} (Id: ${alignment})"
	}
}
