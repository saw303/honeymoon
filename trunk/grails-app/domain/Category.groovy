class Category {

	static hasMany = [ giftItems : GiftItem ]
	
	String name
	Integer alignment
	
	static constraints = {
		name(nullable:false, blank:false, size:1..100, unique:true)
		alignment(nullable:false, blank:false, unique:true, range:1..100)
	}
	
	public String toString() {
		return "Kategorie: ${name} (Id: ${alignment})"
	}
}
