import ch.silviowangler.honeymoon.CartItem
import ch.silviowangler.honeymoon.Customer
import ch.silviowangler.honeymoon.ShoppingCart
import ch.silviowangler.honeymoon.User
import java.text.NumberFormat

class ShoppingCartController {

  def index = { redirect(action: list, params: params) }

  // the delete, save and update actions only accept POST requests
  def static allowedMethods = [delete: 'POST', save: 'POST', update: 'POST', checkout: 'POST', changeAmount: 'POST']


  def list = {
    def cart = ShoppingCart.findBySessionIdAndSold(session.id, Boolean.FALSE)

    if (cart) {

      log.debug("Warenkorb gefunden: ${cart}.")
      return [items: cart.items, total: sumUp(cart), customer: cart.customer]
    }
    else {
      log.debug("Für die Session ${session.id} ist kein Warenkorb vorhanden.")
      return [items: [], total: 0]
    }
  }

  private sumUp = {cart ->

    def sum = 0
    cart.items.each {
      sum += it.amount
    }
    return sum
  }


  def show = {
    def shoppingCart = ShoppingCart.get(params.id)

    if (!shoppingCart) {
      flash.message = "ShoppingCart not found with id ${params.id}"
      redirect(action: list)
    }
    else { return [shoppingCart: shoppingCart] }
  }

  def remove = {
    def shoppingCart = ShoppingCart.findBySessionId(session.id)
    if (shoppingCart) {
      def item = CartItem.get(params.id)

      if (item) {

        if (shoppingCart.items.contains(item)) {
          log.debug("Der Warenkorb beinhaltet vor der Löschung ${shoppingCart.items.size()}.")
          log.info("Lösche item ${item} aus Warenkorb ${shoppingCart}")
          assert shoppingCart.items.remove(item)
          shoppingCart.save(flush: true)
          item.delete(flush: true)
          shoppingCart = ShoppingCart.findBySessionId(session.id)
          log.debug("Nach der Löschung sind noch ${shoppingCart.items.size()} items im Warenkorb.")
        }
        else {
          log.warn("Das ausgewählte Item ${item} ist nicht im Warenkorb enthalten und wird daher nicht gelöscht.")
        }
      }
      else {
        log.info("Das item mit der Id ${params.id} wurde nicht gefunden.")
      }
    }
    render("Total: ${sumUp(shoppingCart)} Franken")
  }

  def edit = {
    def shoppingCart = ShoppingCart.get(params.id)

    if (!shoppingCart) {
      flash.message = "ShoppingCart not found with id ${params.id}"
      redirect(action: list)
    }
    else {
      return [shoppingCart: shoppingCart]
    }
  }

  def update = {
    def shoppingCart = ShoppingCart.get(params.id)
    if (shoppingCart) {
      shoppingCart.properties = params
      if (!shoppingCart.hasErrors() && shoppingCart.save()) {
        flash.message = "ShoppingCart ${params.id} updated"
        redirect(action: show, id: shoppingCart.id)
      }
      else {
        render(view: 'edit', model: [shoppingCart: shoppingCart])
      }
    }
    else {
      flash.message = "ShoppingCart not found with id ${params.id}"
      redirect(action: edit, id: params.id)
    }
  }

  def create = {
    def shoppingCart = new ShoppingCart()
    shoppingCart.properties = params
    return ['shoppingCart': shoppingCart]
  }

  def save = {
    def shoppingCart = new ShoppingCart(params)
    if (!shoppingCart.hasErrors() && shoppingCart.save()) {
      flash.message = "ShoppingCart ${shoppingCart.id} created"
      redirect(action: show, id: shoppingCart.id)
    }
    else {
      render(view: 'create', model: [shoppingCart: shoppingCart])
    }
  }

  def checkout = {
    ShoppingCart cart = ShoppingCart.findBySessionIdAndSold(session.id, Boolean.FALSE)

    if (cart) {

      if (!cart.customer) {
        log.debug("Es wird ein neuer Kunde für Warenkorb ${cart} angelegt.")
        cart.customer = new Customer()
      }
      else {
        log.warn("Der Warenkorb ${cart} hat bereits eine existierenden Kunden!")
      }
      cart.customer.properties = params

      if (!cart.customer.hasErrors() && cart.save()) {
        //Sende
        log.debug("Versuche die Emails zu versenden")

        def messageSubject = message(code: 'mail.cart.checkout.subject', args: [])
        def messageBody = message(code: 'mail.cart.checkout', args: [cart.customer.firstName, cart.customer.lastName, getItemList(cart)])
        def recipients = []

        recipients << User.findByNickname(grailsApplication.config.honeymoon.groom).email
        recipients << User.findByNickname(grailsApplication.config.honeymoon.bride).email
        recipients << User.findByNickname(grailsApplication.config.honeymoon.bridesmaid).email

        sendMail {
          to recipients.toArray()
          bcc 'silvio.wangler@gmail.com'
          subject messageSubject
          body messageBody
        }

        sendMail {
          to cart.customer.email
          bcc 'silvio.wangler@gmail.com'
          subject messageSubject
          body messageBody
        }

        log.info("Versuche den Warenkorb ${cart} als verkauft zu markieren.")
        cart.sold = Boolean.TRUE
        cart.save(flush: true)
        log.info("Verkauf für Warenkorb ${cart} erfolgreich durchgeführt.")

        render(view: 'success', model: [cart: cart, total: sumUp(cart)])
      }
      else {
        flash.message = 'Bitte kontrollieren Sie Ihre Eingabe.'
        log.info("Customer hat Validierungsfehler")
        render(view: 'list', model: [items: cart.items, total: sumUp(cart), customer: cart.customer])
      }
    }
    else {
      log.warn("Checkout wurde aufgerufen. Für die Session-Id ${session.id} konnte kein Warenkorb ermittelt werden.")
    }
  }

  private String getItemList(ShoppingCart cart) {
    StringBuilder sb = new StringBuilder();

    int i = 1;
    int sum = 0;

    cart.items.each {
      sum += it.amount;
      sb.append("${i++}. ${it.giftItem.name}: Ihr Beitrag: ${it.amount} Franken\n")
    }
    sb.append("\n\nTotal ${sum} Franken\n")

    sb.append('\n\nIhre Adresse\n')
    sb.append("${cart.customer.firstName} ${cart.customer.lastName}\n")
    sb.append("${cart.customer.addressLine}\n")
    sb.append("${cart.customer.postCode} ${cart.customer.city}\n")
    sb.append("Email: ${cart.customer.email}\n")

    return sb.toString();
  }

  def changeAmount = {

    ShoppingCart cart = ShoppingCart.findBySessionIdAndSold(session.id, Boolean.FALSE)

    if (cart) {
      log.info("Suche nach CartItem ${params.id}")
      def item = CartItem.get(params.id)
      log.info("Suche nach dem Item im Warenkorb")

      if (item) {
        log.info("Versuche CartItem Amount von ${item.amount} Franken auf '${params.value}' Franken zu setzen.")
        if (params.value.isNumber()) {
          item.amount = params.value.toInteger()
          item.save(flush: true)
          log.info("CartItem erfolgreich gespeichert.")
        }
      }
      else {
        log.error("CartItem ${params.id} existiert nicht")
      }

      def format = NumberFormat.getCurrencyInstance(new Locale('de', 'CH'))
      render("Total: ${format.format(sumUp(cart))}")
    }
    else {
      log.warn("Zu Session-ID ${session.id} konnte kein Warenkorb gefunden werden.")
      render("Total: 0 Franken")
    }
  }
}