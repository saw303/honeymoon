  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>GiftItem List</title>
    </head>
    <body>
        <div class="nav">            
            <span class="menuButton"><g:link class="create" action="create">Neues Geschenk eintragen</g:link></span>
        </div>
        <div class="body">
            <h1>Unser Wunschbuch</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="description" title="Beschreibung" />
                        
                   	        <g:sortableColumn property="image" title="Image" />
                        
                   	        <g:sortableColumn property="price" title="Preis" />

                            <g:sortableColumn property="active" title="Status" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${giftItemList}" status="i" var="giftItem">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${giftItem.id}">${giftItem.name?.encodeAsHTML()}</g:link></td>
                        
                            <td>${giftItem.description?.encodeAsHTML()}</td>
                        
                            <td>${giftItem.image?.encodeAsHTML()}</td>
                        
                            <td>${giftItem.price?.encodeAsHTML()}</td>

                            <td>${giftItem.active?.encodeAsHTML()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${GiftItem.count()}" />
            </div>
        </div>
    </body>
</html>
