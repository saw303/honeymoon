            
class ShoppingCartController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']
	

    def list = {
		def cart = ShoppingCart.findBySessionId(session.id)
		
		if (cart) {
		
			log.debug("Warenkorb gefunden: ${cart}.")
			return [items: cart.items, total: sumUp(cart) ]
		}
		else
		{
			log.debug("Für die Session ${session.id} ist kein Warenkorb vorhanden.")
			return [items: [], total: 0]
		}
    }

    private sumUp = { cart ->

        def sum = 0
        cart.items.each {
            sum += it.amount
        }
        return sum        
    }


    def show = {
        def shoppingCart = ShoppingCart.get( params.id )

        if(!shoppingCart) {
            flash.message = "ShoppingCart not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ shoppingCart : shoppingCart ] }
    }    

    def remove = {
        def shoppingCart = ShoppingCart.findBySessionId(session.id)
        if(shoppingCart) {
            def item = CartItem.get(params.id)

            if (item) {

                if (shoppingCart.items.contains(item))
                {
                    log.debug("Der Warenkorb beinhaltet vor der Löschung ${shoppingCart.items.size()}.")
                    log.info("Lösche item ${item} aus Warenkorb ${shoppingCart}")
                    assert shoppingCart.items.remove(item)
                    shoppingCart.save(flush:true)
                    item.delete(flush:true)
                    shoppingCart = ShoppingCart.findBySessionId(session.id)
                    log.debug("Nach der Löschung sind noch ${shoppingCart.items.size()} items im Warenkorb.")
                }
                else
                {
                    log.warn("Das ausgewählte Item ${item} ist nicht im Warenkorb enthalten und wird daher nicht gelöscht.")
                }
            }
            else
            {
                log.info("Das item mit der Id ${params.id} wurde nicht gefunden.")
            }
        }        
        render("Total: ${sumUp(shoppingCart)} Franken")
    }

    def edit = {
        def shoppingCart = ShoppingCart.get( params.id )

        if(!shoppingCart) {
            flash.message = "ShoppingCart not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ shoppingCart : shoppingCart ]
        }
    }

    def update = {
        def shoppingCart = ShoppingCart.get( params.id )
        if(shoppingCart) {
            shoppingCart.properties = params
            if(!shoppingCart.hasErrors() && shoppingCart.save()) {
                flash.message = "ShoppingCart ${params.id} updated"
                redirect(action:show,id:shoppingCart.id)
            }
            else {
                render(view:'edit',model:[shoppingCart:shoppingCart])
            }
        }
        else {
            flash.message = "ShoppingCart not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def shoppingCart = new ShoppingCart()
        shoppingCart.properties = params
        return ['shoppingCart':shoppingCart]
    }

    def save = {
        def shoppingCart = new ShoppingCart(params)
        if(!shoppingCart.hasErrors() && shoppingCart.save()) {
            flash.message = "ShoppingCart ${shoppingCart.id} created"
            redirect(action:show,id:shoppingCart.id)
        }
        else {
            render(view:'create',model:[shoppingCart:shoppingCart])
        }
    }
}