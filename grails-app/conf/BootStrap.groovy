import grails.util.GrailsUtil
import ch.matssonja.GiftItemCategory
import ch.matssonja.User
import ch.matssonja.GiftItem
import ch.matssonja.GuestbookEntry

class BootStrap {

  String env = GrailsUtil.getEnvironment();

  def init = {servletContext ->

    log.debug("Grails environment is: ${env}")

    def userList = [
            new User(firstname: "Silvio", lastname: "Wangler", nickname: "saw", email: "silvio@silviowangler.ch", password: "gravis"),
            new User(firstname: "Matthias", lastname: "Stulz", nickname: "mats", email: "matthiasstulz@hotmail.com", password: "mats2010"),
            new User(firstname: "Sonja", lastname: "Müller", nickname: "sonja", email: "zuerimuusli@hotmail.com", password: "sonja2010"),
            new User(firstname: "Debora", lastname: "Müller", nickname: "debora", email: "debora@heise.de", password: "debora2010")]

    userList.each {
      if (!User.findByNickname(it.nickname) && it.validate()) {
        println("Saving ${it.nickname}")
        assert it.save(): "Cannot save user ${it}".toString()
      }
      else {
        println("Cannot save user: ${it}")
      }
    }

    if (env != 'production') {
      log.debug("Erstelle Dummy Kategorien...")
      GiftItemCategory cat = new GiftItemCategory(name: 'Flug', alignment: 1)
      cat.save(flush: true)

      GiftItemCategory cat2 = new GiftItemCategory(name: 'Drinx', alignment: 2)
      cat2.save(flush: true)

      5.times {
        new GuestbookEntry(author: "Silvio Wangler-${it}", authorEmail: 'silvio@silviowangler.ch', title: "hello you-${it}", message: 'wicked stuff').save();

        if (it % 2 == 0) {
          new GiftItem(name: "Wunsch-${it}", description: 'Irgendein Wunsch', price: it * 3, active: true, image: 'images/pix/placeholder_480x360.gif', category: cat).save(flush: true);
        }
        else {
          new GiftItem(name: "Wunsch-${it}", description: 'Irgendein Wunsch', price: it * 5, active: true, image: 'images/pix/placeholder_480x360.gif', category: cat2).save(flush: true);
        }
      }
    }
  }
  def destroy = {
  }
} 