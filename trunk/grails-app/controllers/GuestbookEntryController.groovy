class GuestbookEntryController {

    def index = { redirect(action:list,params:params) }

    def allowedMethods = [delete:'GET', save:'POST']

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
		
		if(guestbookEntry.save()) {
			flash.message = "Ihre Nachricht wurde ins Gästebuch eingetragen. Besten Dank"
			redirect(action:show,id:guestbookEntry.id)
		}
		else {
			render(view:'create',model:[guestbookEntry:guestbookEntry])
		}
    }

    def delete = {
        def guestbookEntry = GuestbookEntry.get( params.id )
        if(guestbookEntry) {
            guestbookEntry.delete()
            flash.message = "Gästebucheintrag ${params.id} gelöscht."
            redirect(action:list)
        }
        else {
            flash.message = "Es konnte keine Gästebucheintrag mit der ID ${params.id} gefunden werden."
            redirect(action:list)
        }
    }

}