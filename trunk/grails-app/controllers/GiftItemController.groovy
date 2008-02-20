import javax.servlet.ServletContext; 

class GiftItemController {
    
    def index = {        
        render(view:'index', model:[categories: Category.list(sort:"alignment", order:"asc")])
    }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST', addToChart:'POST']

    def list = {

        log.debug("Input: Current max param is ${params.max}, current offset is ${params.offset}")

        // TODO: Active flag wird für das Auslesen der Einträge nicht berücksichtigt.
        if(!params.max) params.max = 2
        if(!params.offset || (params.offset.isInteger() && params.offset.toInteger() < 0)) params.offset = 0

        log.info("Set to: Current max param is ${params.max}, current offset is ${params.offset}")

        if (params.category)
        {
            log.debug("suche nach einträgen mit der kategorie ${params.category}")
            def category = Category.findByName(params.category)

            if (category)
            {
                log.debug("kategorie ${params.category} gefunden")
                def gifts = GiftItem.findAllByCategory(category, params)
                log.debug("es werden ${gifts.size()} items zurückgegeben.")
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

    def addToChart = {

        if (!params.id && params.id.isInteger())
        {
            log.error('beim hinzufügen in den warenkorb war keine Id vorhanden oder es war keine zahl :(')
            flash.message = 'Leider konnte ihr Beitrag nicht gespeichert werden.'
            render(view: 'index')
        }
        else
        {
            log.debug("versuche giftitem id ${params.id} zu lesen. der kunden spendet einen betrag von ${params.amount} franken.")
            GiftItem item = GiftItem.get(params.id)

            if (item)
            {
                log.debug("Item gefunden --> ${item}")
                log.info("Suche Warenkorb mit Session ID ${session.id}")
                ShoppingCart cart = ShoppingCart.findBySessionId(session.id)

                if (cart) {
                    log.info("Warenkorb wurde aus der Datenbank geholt (${cart})")
                }
                else {
                    log.info("Warenkorb wird neu für session id ${session.id} angelegt")
                    cart = new ShoppingCart(sessionId: session.id, items: [])
                }

                if (params.amount && params.amount.isInteger() && params.amount.toInteger() > 0)
                {
                    // cartItem erstellen
                    CartItem cartItem = new CartItem(amount: params.amount.toInteger(), giftItem: item);                    
                    cart.items << cartItem

                    if (cart.save())
                    {
                        log.debug('Warenkorb erfolgreich gespeichert')
                    }
                    else {
                        log.error('Fehler beim speichern des Warenkorbs')
                    }
                }
                else
                {
                    log.warn("Der Betrag ist ungültig (Usereingabe: ${params.amount})")
                }


                redirect(view:'index', model:[categories: Category.list(sort:"alignment", order:"asc")])
            }
            else
            {
                flash.message = "item ${params.id} nicht gefunden. kann es nicht in den warenkorb legen."
                log.warn("item ${params.id} nicht gefunden. kann es nicht in den warenkorb legen.")
                render(view:'show')
            }

        }
    }
}