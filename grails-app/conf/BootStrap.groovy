import ch.silviowangler.honeymoon.GiftItem
import ch.silviowangler.honeymoon.GiftItemCategory
import ch.silviowangler.honeymoon.GuestbookEntry
import ch.silviowangler.honeymoon.User
import grails.util.GrailsUtil
import ch.silviowangler.honeymoon.User
import ch.silviowangler.honeymoon.GiftItemCategory

class BootStrap {

  String env = GrailsUtil.getEnvironment();

  def grailsApplication

  def init = {servletContext ->

    log.debug("Grails environment is: ${env}")

    def userList = [
            new User(firstname: "Silvio", lastname: "Wangler", nickname: grailsApplication.config.honeymoon.admin, email: "silvio@silviowangler.ch", password: "gravis"),
            new User(firstname: "Marcel", lastname: "Weber", nickname: grailsApplication.config.honeymoon.groom, email: "maese.weber@gmail.com", password: "maese2011"),
            new User(firstname: "Sabine", lastname: "Berger", nickname: grailsApplication.config.honeymoon.bride, email: "a@b.ch", password: "sabine2011"),
            new User(firstname: "A", lastname: "B", nickname: grailsApplication.config.honeymoon.bestman, email: "a@b.ch", password: "abcdef"),
            new User(firstname: "C", lastname: "D", nickname: grailsApplication.config.honeymoon.bridesmaid, email: "c@d.ch", password: "abcdef")]

    userList.each {
      if (!User.findByNickname(it.nickname) && it.validate()) {
        println("Saving ${it.nickname}")
        assert it.save(): "Cannot save user ${it}".toString()
      }
      else {
        if (it.validate()) {
          println("user: ${it.nickname} already exists in database")
        } else {
          it.errors.allErrors.each {
            println it
          }
        }
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
          new GiftItem(name: "Wunsch-${it}", description: 'Irgendein Wunsch', active: true, image: 'images/pix/placeholder_480x360.gif', category: cat).save(flush: true);
        }
        else {
          new GiftItem(name: "Wunsch-${it}", description: 'Irgendein Wunsch', active: true, image: 'images/pix/placeholder_480x360.gif', category: cat2).save(flush: true);
        }
      }
    }
  }
  def destroy = {
  }
}