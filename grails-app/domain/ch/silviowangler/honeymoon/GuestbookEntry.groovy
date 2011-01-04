package ch.silviowangler.honeymoon
class GuestbookEntry
{
    String author
    String authorEmail
    String title
    String message
    Date entryDate = new Date()

    static constraints = {
        author(nullable:false, blank:false, length: 1..25)
        authorEmail(email:true, length: 1..100)
        title(nullable:false, blank:false, length:1..100)
        message(nullable:false, blank:false, length:1..2500)
        entryDate(nullable:false)
    }

    String toString()
    {
        return "GuestbookEntry ${id} written by $author (${authorEmail}) - tile: $title".toString()
    }
}
