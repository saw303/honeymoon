  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />        
    </head>
    <body>
		<g:if test="${session.user != null}">
	        <div class="nav">	            
	            <span class="menuButton"><g:link class="list" action="list">Alle Wunschbucheintr&auml;ge anzeigen</g:link></span>
	            <span class="menuButton"><g:link class="create" action="create">Neuer Wunsch eintragen</g:link></span>
	        </div>
		</g:if>
        <div class="body">
            <h1>Eines der schönen W&uuml;nsche</h1>
            <g:if test="${flash.message}">
	            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${giftItem.id}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Titel / Überschrift:</td>
                            
                            <td valign="top" class="value">${giftItem.name}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Bezeichnung:</td>
                            
                            <td valign="top" class="value">${giftItem.description}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Bild:</td>
                            
                            <td valign="top" class="value"><img src="/lebenslaenglich/${giftItem.image}" alt="${giftItem.name}" /></td>
                            
                        </tr>
						
						<tr class="prop">
                            <td valign="top" class="name">Pfad:</td>
                            
                            <td valign="top" class="value">${giftItem.image}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Preis:</td>
                            
                            <td valign="top" class="value">${giftItem.price}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Status:</td>

                            <td valign="top" class="value">${giftItem.active}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Category:</td>
                            
                            <td valign="top" class="value"><g:link controller="category" action="show" id="${giftItem?.category?.id}">${giftItem?.category}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
			<g:if test="${session.user != null}">
	            <div class="buttons">
	                <g:form controller="giftItem">
	                    <input type="hidden" name="id" value="${giftItem?.id}" />
	                    <span class="button"><g:actionSubmit class="edit" value="Bearbeiten" action="edit"/></span>
	                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Sind Sie sicher?');" value="Löschen" action="delete" /></span>
	                </g:form>
	            </div>
			</g:if>
        </div>
    </body>
</html>
