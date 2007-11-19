class GuestbookEntryController {

    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max)params.max = 10
        [ guestbookEntryList: GuestbookEntry.list( params ) ]
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
            flash.message = "GuestbookEntry ${guestbookEntry.id} created."
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