class BootStrap {

     def init = { servletContext ->
		
		def userList = []
        
		if (! User.findByNickname('saw') )
		{
		    println("Saving Silvio")
		    userList << new User(firstname:"Silvio", lastname:"Wangler", nickname:"saw", email:"silvio.wangler@gmail.com", password:"gravis")
		}

		if (! User.findByNickname('daw') )
		{
		    println("Saving Daniela")
		    userList << new User(firstname:"Daniela", lastname:"Wangler", nickname:"daw", email:"daniela.wangler@derendinger.ch", password:"123456")
		}

		if (! User.findByNickname('doldeste') )
		{
		    println("Saving Stefan")
		    userList << new User(firstname:"Stefan", lastname:"Dolder", nickname:"doldeste", email:"doldeste@gmail.com", password:"123456")
		}

		if (! User.findByNickname('carmen') )
		{
		    println("Saving Carmen")
		    userList << new User(firstname:"Carmen", lastname:"Tschopp", nickname:"carmen", email:"a@b.ch", password:"123456")
		}

		if (! User.findByNickname('mats') )
		{
		    println("Saving Matthias")
		    userList <<  new User(firstname:"Matthias", lastname:"Fröhlicher", nickname:"mats", email:"a@b.ch", password:"123456")
		}

		userList.each {
		    if (it.validate()) { it.save() }
		    else { println("Is shit: ${it}")}
		}

		User.list().each {
		    println(it)
		}
		
		Category cat = new Category(name:'Flug', alignment: 1)
		cat.save(flush:true)

		Category cat2 = new Category(name:'Drinx', alignment: 2)
		cat2.save(flush:true)

        5.times {
            new GuestbookEntry(author:"Silvio Wangler-${it}", authorEmail:'silvio@silviowangler.ch', title:"hello you-${it}", message:'wicked stuff').save();

            if (it % 2 == 0)
                new GiftItem(name:"Wunsch-${it}", description:'Irgendein Wunsch', price: it * 3, active:true, image:'images/items/hugo.jpg', category: cat).save(flush:true);
            else
                new GiftItem(name:"Wunsch-${it}", description:'Irgendein Wunsch', price: it * 5, active:true, image:'images/items/hugo.jpg', category: cat2).save(flush:true);

        }
     }
     def destroy = {
     }
} 