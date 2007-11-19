import javax.servlet.ServletContext; 

class GiftItemController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max)params.max = 10
        [ giftItemList: GiftItem.list( params ) ]
    }

    def show = {
        [ giftItem : GiftItem.get( params.id ) ]
    }

    def delete = {
        def giftItem = GiftItem.get( params.id )
        if(giftItem) {
            giftItem.delete()
            flash.message = "GiftItem ${params.id} deleted."
            redirect(action:list)
        }
        else {
            flash.message = "GiftItem not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def giftItem = GiftItem.get( params.id )

        if(!giftItem) {
                flash.message = "GiftItem not found with id ${params.id}"
                redirect(action:list)
        }
        else {
            return [ giftItem : giftItem ]
        }
    }

    def update = {
        def giftItem = GiftItem.get( params.id )
        if(giftItem) {
             giftItem.properties = params
            if(giftItem.save()) {
                flash.message = "GiftItem ${params.id} updated."
                redirect(action:show,id:giftItem.id)
            }
            else {
                render(view:'edit',model:[giftItem:giftItem])
            }
        }
        else {
            flash.message = "GiftItem not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
      def giftItem = new GiftItem()
      giftItem.properties = params
      return ['giftItem':giftItem]
    }

    def save = {
        def giftItem = new GiftItem()
        giftItem.properties = params

        def file = request.getFile('image');

        ServletContext ctx =  request.getSession().getServletContext()
        def path = ctx.getRealPath('/WEB-INF/')

        if(giftItem.save()) {
            flash.message = "GiftItem ${giftItem.id} created."
            redirect(action:show,id:giftItem.id)
        }
        else {
            render(view:'create',model:[giftItem:giftItem])
        }
    }

}