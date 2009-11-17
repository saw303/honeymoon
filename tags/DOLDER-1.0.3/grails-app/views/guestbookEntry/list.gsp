  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>GuestbookEntry List</title>

        <style type="text/css">
            .gbook {
                border: 1px solid #FFFFFF;
            }
        </style>
    </head>
    <body>
        <div class="nav">            
            <span class="menuButton"><g:link class="create" action="create">Tragen Sie sich auch ins G&auml;stebuch ein</g:link></span>
        </div>
        <div class="body">
            <h2>Unser G&auml;stebuch</h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:each in="${guestbookEntryList}" status="i" var="guestbookEntry">
                <div class="gbook">
                    <table>
                        <tbody>
                            <tr>
                                <td>${guestbookEntry.title?.encodeAsHTML()}
                                    <br/>von ${guestbookEntry.author?.encodeAsHTML()} (${guestbookEntry.authorEmail?.encodeAsHTML()})
								    geschrieben am <g:formatDate format="dd.MM.yyyy HH:mm" date="${guestbookEntry.entryDate}"/>
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
                        </tbody>
                    </table>
                </div>
                <p>&nbsp;</p>
            </g:each>            
            <div class="paginateButtons">
                <g:paginate total="${GuestbookEntry.count()}" />
            </div>
        </div>
    </body>
</html>
