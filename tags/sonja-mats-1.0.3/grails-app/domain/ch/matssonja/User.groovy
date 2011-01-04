package ch.matssonja
class User {

	String firstname
	String lastname
	String nickname
	String email
	String password
	Boolean locked = Boolean.FALSE;
	
	static constraints = {
		firstname(blank:false, nullable:false, size:1..30)
		lastname(blank:false, nullable:false, size:1..30)
		nickname(nullable:false, blank:false, unique:true, size:3..10)
		email(email:true, nullable:false, size: 3..255)
		password(blank:false, nullable:false, size:6..15)
		locked(nullable:false)
	}
	
	public String toString() {
		return "${firstname} ${lastname} (${email}), Status: ${locked == Boolean.TRUE ? 'locked' : 'unlocked'}";
	}

   public String generateFullName() {
      "$firstname $lastname".toString()
   }

}