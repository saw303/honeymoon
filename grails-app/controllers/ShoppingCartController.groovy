            
class ShoppingCartController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']
	

    def list = {
		def cart = ShoppingCart.findBySessionId(session.id)
		
		def sum = 0
		
		if (cart) {
		
			cart.items.each {
				sum += it.amount
			}
		
			log.debug("Warenkorb gefunden: ${cart}")
			return [items: cart.items, total: sum ]
		}
		else
		{
			log.debug("Für die Session ${session.id} ist kein Warenkorb vorhanden.")
			return [items: [], total: sum]
		}
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
        render "hello world"
    }

    def remove2 = {
        def shoppingCart = ShoppingCart.findBySessionId(session.id)
        if(shoppingCart) {
            def item = CartItem.get(params.id)

            if (item) {

                if (shoppingCart.items.contains(item))
                {
                    log.info("Lösche item ${item} aus Warenkorb ${shoppingCart}")
                    assert shoppingCart.items.remove(item)
                    assert shoppingCart.save()

                    item.delete()

                    render {
                        div(class:'message') {
                            "Der Eintrag wurde erfolgreich geloescht."
                        }
                    }
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
        else
        {
            render {
                div(class:'message') {
                    "Der Eintrag konnte nicht geloescht werden."
                }
            }
        }
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