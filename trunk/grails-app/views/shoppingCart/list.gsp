

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>ShoppingCart List</title>
    </head>
    <body>        
        <div class="body">
            <h1>Ihr Warenkorb</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div>Willkommen in Ihrem Warenkorb. Sollte ihr Warenkorb noch leer sein, dann k&ouml;nnen Sie ihn beim Durchst&ouml;bern des <g:link controller="giftItem">Wunschbuchs</g:link> auff&uuml;llen.</div>

            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <th>Warenkorbeintr&auml;ge</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${shoppingCartList}" status="i" var="shoppingCart">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">                        
                            <td><g:link action="show" id="${shoppingCart.id}">${shoppingCart.items?.encodeAsHTML()}</g:link></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${ShoppingCart.count()}" />
            </div>
        </div>
    </body>
</html>
