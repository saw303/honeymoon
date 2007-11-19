class BootStrap {

     def init = { servletContext ->

        (1..20).each {
            new GuestbookEntry(author:"Silvio${it}", authorEmail:'saw303@gmx.ch', title:'hello you', message:'wicked stuff').save();
            new GiftItem(name:"Wunsch-${it}", description:'Irgendein Wunsch', price: 1, active:true).save();
        }
     }
     def destroy = {
     }
} 