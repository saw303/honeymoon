import ch.silviowangler.honeymoon.GiftItemCategory

class GiftItemCategoryController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ categoryList: GiftItemCategory.list( params ) ]
    }

    def show = {
        [ category : GiftItemCategory.get( params.id ) ]
    }

    def delete = {
        def category = GiftItemCategory.get( params.id )
        if(category) {
            category.delete()
            flash.message = "Category ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Category not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def category = GiftItemCategory.get( params.id )

        if(!category) {
            flash.message = "Category not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ category : category ]
        }
    }

    def update = {
        def category = GiftItemCategory.get( params.id )
        if(category) {
            category.properties = params
            if(!category.hasErrors() && category.save()) {
                flash.message = "Category ${params.id} updated"
                redirect(action:show,id:category.id)
            }
            else {
                render(view:'edit',model:[category:category])
            }
        }
        else {
            flash.message = "Category not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def category = new GiftItemCategory()
        category.properties = params
        return ['category':category]
    }

    def save = {
        def category = new GiftItemCategory(params)
        if(!category.hasErrors() && category.save()) {
            flash.message = "Category ${category.id} created"
            redirect(action:show,id:category.id)
        }
        else {
            render(view:'create',model:[category:category])
        }
    }
}