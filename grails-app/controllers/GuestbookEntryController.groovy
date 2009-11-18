class GuestbookEntryController {

    def index = { redirect(action:list,params:params) }

    def static allowedMethods = [delete:'GET', save:'POST']

    def list = {
        if(!params.max)params.max = 5
        if(!params.offset)params.offset = 0
        [ guestbookEntryList: GuestbookEntry.listOrderByEntryDate( max: params.max, offset: params.offset , order:"desc") ]
    }

    def show = {
        [ guestbookEntry : GuestbookEntry.get( params.id ) ]
    }

    def create = {
      def guestbookEntry = new GuestbookEntry()
      guestbookEntry.properties = params
      return ['guestbookEntry':guestbookEntry]
    }

    def save = {
        def guestbookEntry = new GuestbookEntry()
        guestbookEntry.properties = params
		
		if (params.captcha.toUpperCase() == session.captcha) {
            if(guestbookEntry.save()) {
				flash.message = "Ihre Nachricht wurde ins G�stebuch eingetragen. Besten Dank"
				redirect(action:show,id:guestbookEntry.id)
			}
			else {
				render(view:'create',model:[guestbookEntry:guestbookEntry])
			}
        }
        else {
            flash.message = "Bitte geben Sie den Anti Spam Code ein."
            render(view:'create',model:[guestbookEntry:guestbookEntry])
        }
    }

    def delete = {
        def guestbookEntry = GuestbookEntry.get( params.id )
        if(guestbookEntry) {
            guestbookEntry.delete()
            flash.message = "G�stebucheintrag ${params.id} gel�scht."
            redirect(action:list)
        }
        else {
            flash.message = "Es konnte keine G�stebucheintrag mit der ID ${params.id} gefunden werden."
            redirect(action:list)
        }
    }

}