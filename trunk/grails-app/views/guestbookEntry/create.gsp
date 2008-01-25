  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create GuestbookEntry</title>         
    </head>
    <body>        
        <div class="body">
            <h1>Erstellen Sie einen neuen G&auml;stebucheintrag</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${guestbookEntry}">
            <div class="errors">
                <g:renderErrors bean="${guestbookEntry}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='author'>Ihr Name:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:guestbookEntry,field:'author','errors')}'>
                                    <input type="text" id='author' name='author' value="${fieldValue(bean:guestbookEntry,field:'author')}"/>
                                </td>
                            </tr> 
                        
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='authorEmail'>Ihre Email:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:guestbookEntry,field:'authorEmail','errors')}'>
                                    <input type="text" id='authorEmail' name='authorEmail' value="${fieldValue(bean:guestbookEntry,field:'authorEmail')}"/>
                                </td>
                            </tr> 
                        
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='title'>Titel des Eintrags:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:guestbookEntry,field:'title','errors')}'>
                                    <input type="text" id='title' name='title' value="${fieldValue(bean:guestbookEntry,field:'title')}"/>
                                </td>
                            </tr> 
                        
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='message'>Ihre Nachricht:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:guestbookEntry,field:'message','errors')}'>
									<g:textArea name="message" value="${fieldValue(bean:guestbookEntry,field:'message')}" rows="5" cols="40"/>                                    
                                </td>
                            </tr>                             
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Ins G&auml;stebuch eintragen"></input></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
