class ShoppingCartTests extends GroovyTestCase {

    void testAddItemsToShoppingCart() {

        def final sessionId = 'xsdsd3sadsa'

        def drinx = new Category(name: 'Drinks', alignment: 1)
        def flight = new Category(name: 'Flight', alignment: 2)
        assert drinx.save()
        assert flight.save()

        def x = new GiftItem(name: 'asdfds', description:'adsf', price: 2, category: drinx)
        assert x.save()
        def y = new GiftItem(name: 'dsfa', description:'adsf', price: 3, category: drinx)
        assert y.save()

        ShoppingCart cart = new ShoppingCart(sessionId: sessionId)

        CartItem myCartItem = new CartItem(amount: 4, giftItem: y)        
        cart.items << myCartItem

        assert cart.save(flush:true)
        
        cart = ShoppingCart.findBySessionId(sessionId)        
        assertEquals(1, cart.items.size())
    }
}
