class HomeController {

    def allowedMethods = [list:'GET']

    def index = { redirect(action:list,params:params) }

    def list = { render(view:'home') }
}