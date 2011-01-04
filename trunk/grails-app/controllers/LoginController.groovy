import ch.silviowangler.honeymoon.User

class LoginController {

  def static allowedMethods = [index: 'GET', login: 'POST']

  def index = { render(view: 'login')}

  def login = {LoginCommand cmd ->

    if (!cmd.hasErrors()) {
      User u = User.findByNickname(params.name)

      if (u && u.password == params.password && !u.locked) {
        session.user = u
        render(view: 'success')
      }
      else {
        flash.message = 'Benutzerdaten sind nicht richtig'
        redirect(controller: 'home', model: [cmd: cmd])
      }
    }
    else {
      redirect(controller: 'home', model: [cmd: cmd])
    }
  }

  def logout = {
    log.info("Logging off user ${session.user.nickname}...")
    session.user = null
    session.invalidate()
    redirect(uri: "/")
  }
}

class LoginCommand {
  String name
  String password

  static constraints = {
    name(blank: false)
    password(blank: false)
  }

  public String toString() {
    return "${name} / ${password}"
  }
}