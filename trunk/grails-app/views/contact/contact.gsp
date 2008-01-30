  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Einen Trauzeugen kontaktieren</title>         
    </head>
    <body>        
        <div class="body">
            <h1>Einen Trauzeugen kontaktieren</h1>
			<g:hasErrors bean="${command}">
	            <div class="errors">
	                <g:renderErrors bean="${command}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form action="send" method="post" >
                <div class="dialog">
					<g:hiddenField name="redir" value="${redir}" />
                    <table>
                        <tbody>
                        
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='author'>Ihr Name:</label>
                                </td>
                                <td valign='top' class='value '>
                                    <input type="text" id='name' name='name' value="${fieldValue(bean:command,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='email'>Ihre Emailadresse:</label>
                                </td>
                                <td valign='top' class='value '>
                                    <input type="text" id='email' name='email' value="${fieldValue(bean:command,field:'email')}"/>
                                </td>
                            </tr>
                        
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='message'>Ihre Nachricht:</label>
                                </td>
                                <td valign='top' class='value '>
									<g:textArea id='message' name="message" value="${fieldValue(bean:command,field:'message')}" rows="5" cols="40"/>                                    
                                </td>
                            </tr>						
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Trauzeuge kontaktieren"></input></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
