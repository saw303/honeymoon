<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
	<g:javascript library="prototype" />

    <script type="text/javascript">
        function toggleSpinner(elementName, status) {            
            document.getElementById(elementName).style.display = status ? 'inline':'none';
        }
    </script>
</head>
<body>
<g:if test="${session.user != null}">
    <div class="nav">
        <span class="menuButton"><g:link class="create" action="create">Neuer Wunsch eintragen</g:link></span>
    </div>
</g:if>
<div class="body">

    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="27%" rowspan="3">
                    <h3>Themenliste / Inhaltsverzeichnis</h3>
                    <p>&nbsp;</p>
                    <p><a href="${createLink(controller: 'giftItem')}">Einleitung</a></p>
                    <p>&nbsp;</p>
                    <g:each in="${categories}" status="i" var="cat">
                        <p><g:link action="list" params="[category:cat.name]">${cat.name}</g:link></p>
                        <p>&nbsp;</p>
                    </g:each>
                </td>
            </tr>
            <tr>
                <!-- 2nd row: category title -->
                <td align="center" colspan="3"><h3>Kategorie: ${currentCategory}</h3></td>
            </tr>
            <tr class="book">
            <!-- 3rd row: giftItem -->
                <g:each in="${giftItemList}" status="i" var="giftItem">

                    <td class="${(i % 2 == 0) ? 'left' : 'right'}" id="cell${i}">
					
						<g:formRemote url="[controller:'giftItem', action:'addToChart']" name="form${i}"                                
                                update="button-${i}" before="toggleSpinner('spinner${i}', true);" after="toggleSpinner('spinner${i}', false);">					
                        
                            <g:hiddenField name="id" value="${giftItem.id}" />
                            <p>
                                <img src="/lebenslaenglich/${giftItem.image}" alt="${giftItem.name?.encodeAsHTML()}" title="${giftItem.name?.encodeAsHTML()}"'}"/>
                            </p>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>

                            <h4>${giftItem.name?.encodeAsHTML()}</h4>

                            <p>&nbsp;</p>
                            <g:if test="${session.user}">
                                <p><g:link action="edit" id="${giftItem.id}">Wunsch bearbeiten</g:link></p>
                            </g:if>
                            <p>&nbsp;</p>
                            <div id="button-${i}">
                                <p>${giftItem.description?.encodeAsHTML()}</p>
                                <p>&nbsp;</p>
                                <p>&nbsp;</p>
                                <p>Ihr Beitrag: <input type="text" name="amount" size="6"> Franken</p>
                                <p>&nbsp;</p>
                                <p><input type="submit" name="Submit" value="In den Warenkorb legen"></p>
                            </div>
                            <div id="spinner${i}" style="display:none">
                                <img src="${createLinkTo(dir: 'images', file:'spinner.gif')}" alt="spinner" title="spinner" />
                            </div>

                        </g:formRemote>
                    </td>
                </g:each>
            </tr>
            <tr>
            <!--
                pagination
                Total items: ${total}
            -->
                <td class="paginateButtons" colspan="3">
                    <g:paginate total="${total}" params="${[category: currentCategory]}"/>
                </td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>
