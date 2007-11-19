  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show GuestbookEntry</title>
    </head>
    <body>
        <div class="body">
            <h1>Show GuestbookEntry</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Autor:</td>
                            
                            <td valign="top" class="value">${guestbookEntry.author}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Email:</td>
                            
                            <td valign="top" class="value">${guestbookEntry.authorEmail}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Titel:</td>
                            
                            <td valign="top" class="value">${guestbookEntry.title}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Nachricht:</td>
                            
                            <td valign="top" class="value">${guestbookEntry.message}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Eingetragen am:</td>
                            
                            <td valign="top" class="value">${guestbookEntry.entryDate}</td>
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form controller="guestbookEntry">
                    <input type="hidden" name="id" value="${guestbookEntry?.id}" />                    
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="L�schen" action="delete"/></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
