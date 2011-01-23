import ch.silviowangler.honeymoon.CartItem
import ch.silviowangler.honeymoon.GiftItem
import ch.silviowangler.honeymoon.GiftItemCategory
import ch.silviowangler.honeymoon.ShoppingCart
import javax.annotation.Resource
import org.springframework.beans.factory.InitializingBean
import org.springframework.http.HttpStatus
import org.springframework.util.Assert

class GiftItemController implements InitializingBean {

  @Resource(name = "imageMimeTypes")
  Map<String, String> mimeTypes

  def static allowedMethods = [index: 'GET', list: 'GET', show: 'GET', delete: 'POST', save: 'POST', update: 'POST', addToChart: 'POST']

  void afterPropertiesSet() {
    Assert.notNull(mimeTypes)
  }



  def index = {
    redirect(action: list, params: params)
  }

  def list = {

    def categories = GiftItemCategory.list(sort: "alignment", order: "asc")
    def map = [:]

    for (GiftItemCategory cat: categories) {
      map[cat] = GiftItem.findAllByCategoryAndActive(cat, Boolean.TRUE)
    }

    [resultMap: map]
  }

  def show = {
    [giftItem: GiftItem.get(params.id)]
  }

  def delete = {
    def giftItem = GiftItem.get(params.id)
    if (giftItem) {
      def file = new File(giftItem?.image)

      if (file.exists()) {
        file.delete()
      }

      giftItem.delete()
      flash.message = "GiftItem ${params.id} deleted."
      redirect(action: list)
    }
    else {
      flash.message = "GiftItem not found with id ${params.id}"
      redirect(action: list)
    }
  }

  def edit = {
    def giftItem = GiftItem.get(params.id)

    if (!giftItem) {
      flash.message = "GiftItem not found with id ${params.id}"
      redirect(action: list)
    }
    else {
      return [giftItem: giftItem]
    }
  }

  def update = {
    def giftItem = GiftItem.get(params.id)
    if (giftItem) {
      giftItem.properties = params
      if (!giftItem.hasErrors() && giftItem.save()) {
        flash.message = "GiftItem ${params.id} updated"
        redirect(action: show, id: giftItem.id)
      }
      else {
        render(view: 'edit', model: [giftItem: giftItem])
      }
    }
    else {
      flash.message = "GiftItem not found with id ${params.id}"
      redirect(action: edit, id: params.id)
    }
  }

  def create = {
    def giftItem = new GiftItem()
    giftItem.properties = params
    return ['giftItem': giftItem]
  }

  def save = {
    def giftItem = new GiftItem(params)

    def file = request.getFile('image');

    if (!file.isEmpty()) {

      def absolutePath = "${grailsApplication.config.honeymoon.upload.dir}"

      def ioFile = new File("$absolutePath/${file.originalFilename}")

      if (ioFile.exists()) {
        log.warn("deleting file ${ioFile.absolutePath}")
        ioFile.delete()
      }
      file.transferTo(ioFile)

      giftItem.image = ioFile.absolutePath
    }

    if (!giftItem.hasErrors() && giftItem.save()) {
      flash.message = "Wunsch (Interne ID: ${giftItem.id}) wurde ins Wunschbuch eingetragen."
      redirect(action: show, id: giftItem.id)
    }
    else {
      render(view: 'create', model: [giftItem: giftItem])
    }
  }

  def addToChart = {

    if (!params.id && params.id.isInteger()) {
      log.error('beim hinzufügen in den warenkorb war keine Id vorhanden oder es war keine zahl :(')
      render {
        p "Leider konnte ihr Beitrag nicht gespeichert werden."
      }
    }
    else {
      log.debug("versuche giftitem id ${params.id} zu lesen. der kunde spendet einen betrag von ${params.amount} franken.")
      GiftItem item = GiftItem.get(params.id)

      if (item) {
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

        if (params.amount && params.amount.isInteger() && params.amount.toInteger() > 0) {
          // cartItem erstellen
          CartItem cartItem = new CartItem(amount: params.amount.toInteger(), giftItem: item);
          cart.items << cartItem

          if (cart.save()) {
            log.debug('Warenkorb erfolgreich gespeichert')
            render {
              p "Ihr Beitrag von ${params.amount} Franken wurde in den Warenkorb gelegt."?.encodeAsHTML()
            }
          }
          else {
            log.error('Fehler beim speichern des Warenkorbs')
            render {
              p "Fehler beim Speichern ihrer Bestellung. Bitte versuchen Sie es erneut und bei weiteren Problemen wenden Sie sich bitte an die Trauzeugen."
            }
          }
        }
        else {
          log.warn("Der Betrag ist ungültig (Usereingabe: ${params.amount})")
          render {
            p 'Bitte geben Sie einen Betrag groesser Null und ohne Rappen an.'
          }
        }
      }
      else {
        flash.message = "item ${params.id} nicht gefunden. kann es nicht in den warenkorb legen."
        log.warn("item ${params.id} nicht gefunden. kann es nicht in den warenkorb legen.")
        render(view: 'show')
      }

    }
  }

  def image = {
    def file = new File(GiftItem.load(params.id)?.image)

    if (file.exists()) {
      assert file.canRead()
      def name = file.absolutePath
      final fileExtension = name.substring(name.lastIndexOf('.') + 1, name.length())
      response.contentLength = file.length()
      response.contentType = mimeTypes.get(fileExtension)
      response.outputStream << file.getBytes()
      response.outputStream.flush()
      response.outputStream.close()
    }
    else {
      log.warn("Unable to find file ${file.absolutePath}")
      render(status: HttpStatus.NOT_FOUND, text: 'Not found')
    }
  }
}