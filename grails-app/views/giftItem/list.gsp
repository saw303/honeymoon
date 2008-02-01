  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>GiftItem List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New GiftItem</g:link></span>
        </div>
        <div class="body">
            <h1>GiftItem List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="description" title="Description" />
                        
                   	        <g:sortableColumn property="image" title="Image" />
                        
                   	        <g:sortableColumn property="price" title="Price" />
                        
                   	        <g:sortableColumn property="active" title="Active" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${giftItemList}" status="i" var="giftItem">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${giftItem.id}">${giftItem.id?.encodeAsHTML()}</g:link></td>
                        
                            <td>${giftItem.name?.encodeAsHTML()}</td>
                        
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
