class HomeController {

    def static allowedMethods = [list:'GET', birdalcouple:'GET', witness:'GET', wedding:'GET']

    def index = { redirect(action:list,params:params) }

    def list = { render(view:'home') }
	
	def birdalcouple = { render(view:'couple') }
	
	def witness = { render(view:'witness') }
	
	def wedding = { render(view:'wedding')}
}