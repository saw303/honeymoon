<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />

        <script type="text/javascript">
            function remove(elementName) {
            
                function remove(elementName) {
                    var nodeToDelete = document.getElementById(elementName);                    
                    nodeToDelete.parentNode.removeChild(nodeToDelete);
                }                
            }
        </script>
    </head>
    <body>        
        <div class="body">
            <h1>Ihr Warenkorb</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div>Willkommen in Ihrem Warenkorb. Sollte ihr Warenkorb noch leer sein, dann k&ouml;nnen Sie ihn beim Durchst&ouml;bern des <g:link controller="giftItem">Wunschbuchs</g:link> auff&uuml;llen.<br/>&nbsp;</div>

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
                        <tr id="${i}" class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>${item.giftItem.name?.encodeAsHTML()}</td>
							<td>${item.amount?.encodeAsHTML()} Franken</td>
							<td>Betrag anpassen, <g:remoteLink action="remove" id="${item.id}"
                                    onSuccess="remove(${i});"
                                    onFailure="alter('Der Eintrag konnte nicht entfernt werden. Bitte aktualisieren Sie die Liste.');">L&ouml;schen</g:remoteLink></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div>
                &nbsp;<br/>Total: ${total} Franken
            </div>
        </div>
    </body>
</html>
