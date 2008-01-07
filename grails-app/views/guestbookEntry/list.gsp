  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>GuestbookEntry List</title>
    </head>
    <body>
        <div class="nav">            
            <span class="menuButton"><g:link class="create" action="create">Neuer G�stebucheintrag</g:link></span>
        </div>
        <div class="body">
            <h1>Unser G�stebuch</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="author" title="Autor" />
                        
                   	        <g:sortableColumn property="authorEmail" title="Email" />
                        
                   	        <g:sortableColumn property="title" title="Titel" />
                        
                   	        <g:sortableColumn property="entryDate" title="Datum" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${guestbookEntryList}" status="i" var="guestbookEntry">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td>${guestbookEntry.author?.encodeAsHTML()}</td>
                        
                            <td>${guestbookEntry.authorEmail?.encodeAsHTML()}</td>
                        
                            <td><g:link action="show" id="${guestbookEntry.id}">${guestbookEntry.title?.encodeAsHTML()}</g:link></td>
                        
                            <td>${guestbookEntry.entryDate?.encodeAsHTML()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${GuestbookEntry.count()}" />
            </div>
        </div>
    </body>
</html>