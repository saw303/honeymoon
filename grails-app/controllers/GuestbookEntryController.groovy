class GuestbookEntryController {

    def index = { redirect(action:list,params:params) }

    def allowedMethods = [delete:'GET', save:'POST']

    def list = {
        if(!params.max)params.max = 10
        [ guestbookEntryList: GuestbookEntry.listOrderByEntryDate( max: params.max , order:"desc") ]
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
            flash.message = "GiftItem ${params.id} deleted."
            redirect(action:list)
        }
        else {
            flash.message = "GuestbookEntry not found with id ${params.id}"
            redirect(action:list)
        }
    }

}