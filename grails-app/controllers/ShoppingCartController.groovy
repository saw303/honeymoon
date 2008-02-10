            
class ShoppingCartController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ shoppingCartList: ShoppingCart.list( params ) ]
    }

    def show = {
        def shoppingCart = ShoppingCart.get( params.id )

        if(!shoppingCart) {
            flash.message = "ShoppingCart not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ shoppingCart : shoppingCart ] }
    }

    def delete = {
        def shoppingCart = ShoppingCart.get( params.id )
        if(shoppingCart) {
            shoppingCart.delete()
            flash.message = "ShoppingCart ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "ShoppingCart not found with id ${params.id}"
            redirect(action:list)
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