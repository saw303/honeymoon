import javax.servlet.ServletContext; 

class GiftItemController {
    
    def index = {        
        render(view:'index', model:[categories: Category.list(sort:"alignment", order:"asc")])
    }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {

        log.debug("Input: Current max param is ${params.max}, current offset is ${params.offset}")

        // TODO: Active flag wird f�r das Auslesen der Eintr�ge nicht ber�cksichtigt.
        if(!params.max) params.max = 2
        if(!params.offset || (params.offset.isInteger() && params.offset.toInteger() < 0)) params.offset = 0

        log.info("Set to: Current max param is ${params.max}, current offset is ${params.offset}")

        if (params.category)
        {
            log.debug("suche nach eintr�gen mit der kategorie ${params.category}")
            def category = Category.findByName(params.category)

            if (category)
            {
                log.debug("kategorie ${params.category} gefunden")
                def gifts = GiftItem.findAllByCategory(category, params)
                log.debug("es werden ${gifts.size()} items zur�ckgegeben.")
                return [ giftItemList: gifts, categories: Category.list(sort:"alignment", order:"asc"), currentCategory: params.category, total: GiftItem.findAllByCategory(category).size(), lastOffset: params.offset ]
            }
            else
            {
                log.debug("kategorie ${params.category} nicht gefunden")
                flash.message = "GiftItem not found with category ${params.category}"
                return [ giftItemList: GiftItem.list( params ), categories: Category.list(sort:"alignment", order:"asc"), currentCategory: 'Alle Kategorien' ]
            }
        }
        else
        {
            log.debug("es wurde keine kategorie angegeben")
            return [ giftItemList: GiftItem.list( params ), categories: Category.list(sort:"alignment", order:"asc") ,currentCategory: 'Alle Kategorien', total: params.max ]
        }
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
            if(!giftItem.hasErrors() && giftItem.save()) {
                flash.message = "GiftItem ${params.id} updated"
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
        def giftItem = new GiftItem(params)

        def file = request.getFile('image');
		
        ServletContext ctx =  request.getSession().getServletContext()
        def path = ctx.getRealPath('/images/items')
		
		def absolutePath = "${path}${File.separator}${file.originalFilename}"
		
		def ioFile = new File(absolutePath)
		
		if (ioFile.exists())
		{
			println "deleting file ${ioFile.absolutePath}"
			ioFile.delete()
		}		
		file.transferTo(ioFile)
		
		giftItem.image = "images/items/${file.originalFilename}"

        if(!giftItem.hasErrors() && giftItem.save()) {
            flash.message = "Wunsch (Interne ID: ${giftItem.id}) wurde ins Wunschbuch eingetragen."
            redirect(action:show,id:giftItem.id)
        }
        else {
            render(view:'create',model:[giftItem:giftItem])
        }
    }
}