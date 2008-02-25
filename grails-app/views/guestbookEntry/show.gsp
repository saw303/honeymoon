  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />        
    </head>
    <body>
        <div class="body">
            <h2>Ihr G&auml;stebucheintrag</h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message?.encodeAsHTML()}</div>
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
        </div>
    </body>
</html>
