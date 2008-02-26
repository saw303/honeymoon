<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
		<g:javascript library="prototype" />

        <script type="text/javascript">
            
            function removeFromTable(elementName) {                
                var nodeToDelete = document.getElementById(elementName);
                nodeToDelete.parentNode.removeChild(nodeToDelete);
            }

        </script>
    </head>
    <body>        
        <div class="body">
            <h2>Ihr Warenkorb</h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div>Willkommen in Ihrem Warenkorb. Sollte ihr Warenkorb noch leer sein, dann k&ouml;nnen Sie ihn beim Durchst&ouml;bern des <g:link controller="giftItem">Wunschbuchs</g:link> auff&uuml;llen.<br/>&nbsp;</div>

            <g:if test="${items.size() > 0}">
                <div class="list">
                    <table id="cartList">
                        <thead>
                            <tr>
                                <th>Warenkorbeintr&auml;ge</th>
                                <th>Ihr Beitrag</th>
                                <th>Optionen</th>
                            </tr>
                        </thead>
                        <tbody>
                        <g:each in="${items}" status="i" var="item">
                            <tr id="row-${i}" class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                <td>${item.giftItem.name?.encodeAsHTML()} (${item.id?.encodeAsHTML()})</td>
                                <td>${item.amount?.encodeAsHTML()} Franken</td>
                                <td>Betrag anpassen, <g:remoteLink action="remove" id="${item.id}"
                                        update="info" class="blackLink"
                                        after="removeFromTable('row-${i}');">L&ouml;schen</g:remoteLink></td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>
                <div id="info">
                    &nbsp;<br/>Total: ${total} Franken
                </div>
            </g:if>
        </div>
    </body>
</html>
