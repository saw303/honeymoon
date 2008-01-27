class BootStrap {

     def init = { servletContext ->

        10.times {
            new GuestbookEntry(author:"Silvio Wangler-${it}", authorEmail:'silvio@silviowangler.ch', title:"hello you-${it}", message:'wicked stuff').save();
            new GiftItem(name:"Wunsch-${it}", description:'Irgendein Wunsch', price: 1, active:true, image:'images/items/hugo.jpg').save();
        }
     }
     def destroy = {
     }
} 