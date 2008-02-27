<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
</head>
<body>
<div class="body">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td width="27%" rowspan="2" align="center">
                <h3>Themenliste / Inhaltsverzeichnis</h3>
                <p>&nbsp;</p>
                <p><a href="${createLink(controller: 'giftItem', action: 'intro')}">Einleitung</a></p>
                <p>&nbsp;</p>
                <g:each in="${categories}" status="i" var="cat">
                    <p><g:link action="list" params="[category:cat.name]">${cat.name}</g:link></p>
                    <p>&nbsp;</p>
                </g:each>
            </td>
        </tr>
        <tr>
            <td align="center"><img src="${createLinkTo(dir: 'images/Homepagebilder', file: 'bookCover.jpg')}" alt="Buch" title="Buch"/></td>
        </tr>
    </table>

</div>
</body>
</html>
