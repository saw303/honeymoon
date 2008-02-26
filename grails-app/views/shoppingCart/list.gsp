<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
		<g:javascript library="prototype" />

        <script type="text/javascript">
            
            function removeFromTable(elementName) {                
                var nodeToDelete = document.getElementById(elementName);
                nodeToDelete.parentNode.removeChild(nodeToDelete);
            }

        </script>
    </head>
    <body>        
        <div class="body">
            <h2>Ihr Warenkorb</h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div>Willkommen in Ihrem Warenkorb. Sollte ihr Warenkorb noch leer sein, dann k&ouml;nnen Sie ihn beim Durchst&ouml;bern des <g:link controller="giftItem">Wunschbuchs</g:link> auff&uuml;llen.<br/>&nbsp;</div>

            <g:if test="${items.size() > 0}">
                <div class="list">
                    <table id="cartList">
                        <thead>
                            <tr>
                                <th>Warenkorbeintr&auml;ge</th>
                                <th>Ihr Beitrag</th>
                                <th>Optionen</th>
                            </tr>
                        </thead>
                        <tbody>
                        <g:each in="${items}" status="i" var="item">
                            <tr id="row-${i}" class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                <td>${item.giftItem.name?.encodeAsHTML()} (${item.id?.encodeAsHTML()})</td>
                                <td><g:remoteField action="changeAmount" update="info"  name="amount" value="${item.amount}" id="${item.id}"/> Franken</td>
                                <td>Betrag anpassen, <g:remoteLink action="remove" id="${item.id}"
                                        update="info" class="blackLink"
                                        after="removeFromTable('row-${i}');">L&ouml;schen</g:remoteLink></td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>
                <div id="info">
                    &nbsp;<br/>Total: ${total} Franken
                </div>
				<div>
					<p>&nbsp;</p>
					<p class="message">Sie k&ouml;nnen nun den Betrag &uuml;berweisen in dem Sie ihre pers&ouml;nlichen Angaben im nachfolgenden Formular eingeben. Sie werden nach erfolgreicher &Uuml;bermittlung Ihrer Daten von den Trauzeugen benachrichtigt.</p>
					<p>&nbsp;</p>
					<g:hasErrors bean="${customer}">
			            <div class="errors">
			                <g:renderErrors bean="${customer}" as="list" />
			            </div>
		            </g:hasErrors>
					<g:form action="checkout" method="post" >
		                <div class="dialog">
		                    <table>
		                        <tbody>
		                        
		                            <tr class="prop">
		                                <td valign="top" class="name">
		                                    <label for="firstName">Vorname:</label>
		                                </td>
		                                <td valign="top" class="value ${hasErrors(bean:customer,field:'firstName','errors')}">
		                                    <input type="text" maxlength="20" id="firstName" name="firstName" value="${fieldValue(bean:customer,field:'firstName')}"/>
		                                </td>
		                            </tr> 
		                        
		                            <tr class="prop">
		                                <td valign="top" class="name">
		                                    <label for="lastName">Nachname:</label>
		                                </td>
		                                <td valign="top" class="value ${hasErrors(bean:customer,field:'lastName','errors')}">
		                                    <input type="text" maxlength="30" id="lastName" name="lastName" value="${fieldValue(bean:customer,field:'lastName')}"/>
		                                </td>
		                            </tr> 
		                        
		                            <tr class="prop">
		                                <td valign="top" class="name">
		                                    <label for="email">Email:</label>
		                                </td>
		                                <td valign="top" class="value ${hasErrors(bean:customer,field:'email','errors')}">
		                                    <input type="text" id="email" name="email" value="${fieldValue(bean:customer,field:'email')}"/>
		                                </td>
		                            </tr> 
		                        
		                            <tr class="prop">
		                                <td valign="top" class="name">
		                                    <label for="adressLine">Strasse:</label>
		                                </td>
		                                <td valign="top" class="value ${hasErrors(bean:customer,field:'adressLine','errors')}">
		                                    <input type="text" maxlength="50" id="adressLine" name="adressLine" value="${fieldValue(bean:customer,field:'adressLine')}"/>
		                                </td>
		                            </tr> 
		                        
		                            <tr class="prop">
		                                <td valign="top" class="name">
		                                    <label for="postCode">Postleitzahl:</label>
		                                </td>
		                                <td valign="top" class="value ${hasErrors(bean:customer,field:'postCode','errors')}">
		                                    <input type="text" maxlength="10" id="postCode" name="postCode" value="${fieldValue(bean:customer,field:'postCode')}"/>
		                                </td>
		                            </tr> 
		                        
		                            <tr class="prop">
		                                <td valign="top" class="name">
		                                    <label for="city">Ort:</label>
		                                </td>
		                                <td valign="top" class="value ${hasErrors(bean:customer,field:'city','errors')}">
		                                    <input type="text" maxlength="30" id="city" name="city" value="${fieldValue(bean:customer,field:'city')}"/>
		                                </td>
		                            </tr> 
		                        
		                        </tbody>
		                    </table>
		                </div>
		                <div class="buttons">
		                    <span class="button"><input class="save" type="submit" value="Beitrag an Trauzeugen senden" /></span>
		                </div>
		            </g:form>
				</div>
				
            </g:if>
        </div>
		
    </body>
</html>
