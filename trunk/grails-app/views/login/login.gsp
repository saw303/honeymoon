<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Bitte melden Sie sich an</title>         
    </head>
    <body>        
        <div class="body">
            <h1>Anmeldung</h1>
			
			<g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${cmd}">
	            <div class="errors">
	                <g:renderErrors bean="${cmd}" as="list" />
	            </div>
            </g:hasErrors>
			
			<g:form action="login" method="post">
				<div class="dialog">
					<table>
                        <tbody>
							<tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='name'>Benutzername:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:cmd,field:'name','errors')}'>
                                    <input type="text" id='name' name='name' value="${fieldValue(bean:cmd,field:'name')}"/>
                                </td>
                            </tr>
							
							<tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='password'>Passwort:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:cmd,field:'password','errors')}'>
									<input id="password "name="password" type="password" maxlength="15">                                    
                                </td>
                            </tr> 
						</tbody>
					</table>
				</div>
				<div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Anmelden"></input></span>
                </div>
			</g:form>
        </div>
    </body>
</html>
