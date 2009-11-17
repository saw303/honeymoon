class CartItemTests extends GroovyTestCase {

    void testSave() {

        def drinx = new Category(name: 'Drinks', alignment: 1)
        def flug = new Category(name: 'Flug', alignment: 2)
        assert drinx.save()
        assert flug.save()

        def x = new GiftItem(name: 'asdfds', description:'adsf', price: 2, category: drinx)
        assert x.save()
        def y = new GiftItem(name: 'dsfa', description:'adsf', price: 3, category: drinx)
        assert y.save()

        CartItem item = new CartItem(amount: 3, giftItem: y)
        assert item.validate()
        assert item.save()

    }
}
