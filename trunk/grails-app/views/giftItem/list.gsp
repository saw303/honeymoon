<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
</head>
<body>
<g:if test="${session.user != null}">
    <div class="nav">
        <span class="menuButton"><g:link class="create" action="create">New GiftItem</g:link></span>
    </div>
</g:if>
<div class="body">

    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="27%" rowspan="4">
                    <h2>Themenliste / Inhaltsverzeichnis</h2>
                    <p>&nbsp;</p>
                    <h2><a href="${createLink(controller: 'giftItem')}">Einleitung</a></h2>
                    <p>&nbsp;</p>
                    <g:each in="${categories}" status="i" var="cat">
                        <h2><g:link action="list" params="[category:cat.name]">${cat.name}</g:link></h2>
                        <p>&nbsp;</p>
                    </g:each>
                </td>
            </tr>
            <tr>
                <!-- 2nd row: category title -->
                <td align="center" colspan="3"><h2>Kategorie: ${currentCategory}</h2></td>
            </tr>
            <tr id="book">
            <!-- 3rd row: giftItem -->
                <g:each in="${giftItemList}" status="i" var="giftItem">

                    <td align="center">
                        <form method="post" name="form${i}">
                            <p>
                                <img src="/lebenslaenglich/${giftItem.image}" alt="${giftItem.name?.encodeAsHTML()}" title="${giftItem.name?.encodeAsHTML()}"/>
                            </p>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>

                            <h1>${giftItem.name?.encodeAsHTML()} (Wert: ${giftItem.price?.encodeAsHTML()} Franken)</h1>

                            <p>&nbsp;</p>
                            <p>&nbsp;</p>

                            <p>${giftItem.description?.encodeAsHTML()}</p>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <p>Ihr Beitrag: <input type="text" name="${giftItem.name}" maxlength="${giftItem.price.toString().length()}" size="6"> Franken</p>
                            <p>&nbsp;</p>

                            <p>
                                <input type="submit" name="Submit" value="In den Warenkorb legen">
                            </p>
                        </form>
                    </td>
                </g:each>
            </tr>
            <tr>
            <!--
                pagination
                Total items: ${total}
            -->
                <g:if test="${lastOffset - 2 >= 0}">
                    <td><g:link action="list" params="[category: currentCategory, offset: lastOffset - 2]">vorherige</g:link></td>
                </g:if>
                <g:else>
                    <td>&nbsp;</td>
                </g:else>
                <g:if test="${total >= lastOffset + 2}">
                    <td><g:link action="list" params="[category: currentCategory, offset: lastOffset + 2]">n&auml;chste</g:link></td>
                </g:if>
                <g:else>
                    <td>&nbsp;</td>
                </g:else>
            </tr>
        </table>
    </div>
</div>
</body>
</html>
