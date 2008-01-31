  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>GuestbookEntry List</title>
    </head>
    <body>
        <div class="nav">            
            <span class="menuButton"><g:link class="create" action="create">Tragen Sie sich auch ins G&auml;stebuch ein</g:link></span>
        </div>
        <div class="body">
            <h1>Unser Gästebuch</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div>
                <table>
                    <!-- thead>
                        <tr>
                        
                   	        <g:sortableColumn property="author" title="Autor" />
                        
                   	        <g:sortableColumn property="authorEmail" title="Email" />
                        
                   	        <g:sortableColumn property="title" title="Titel" />
                        
                   	        <g:sortableColumn property="entryDate" title="Datum" />
                        
                        </tr>
                    </thead -->
                    <tbody>
                    <g:each in="${guestbookEntryList}" status="i" var="guestbookEntry">
						<tr>
							<td>${++i}. ${guestbookEntry.title?.encodeAsHTML()} 
								<br/>von ${guestbookEntry.author?.encodeAsHTML()} (${guestbookEntry.authorEmail?.encodeAsHTML()})
								geschrieben am ${guestbookEntry.entryDate?.encodeAsHTML()}
							</td>
						</tr>						
						<tr>
							<td>${guestbookEntry.message?.encodeAsHTML()}</td>
						</tr>
						<g:if test="${session.user != null}">
							<tr>
								<td><a href="<g:createLink action="delete" id="${guestbookEntry.id}" />">L&ouml;schen</a></td>
							</tr>
						</g:if>
					
                        <!-- tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td>${guestbookEntry.author?.encodeAsHTML()}</td>
                        
                            <td>${guestbookEntry.authorEmail?.encodeAsHTML()}</td>
                        
                            <td><g:link action="show" id="${guestbookEntry.id}">${guestbookEntry.title?.encodeAsHTML()}</g:link></td>
                        
                            <td>${guestbookEntry.entryDate?.encodeAsHTML()}</td>
                        
                        </tr -->
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
