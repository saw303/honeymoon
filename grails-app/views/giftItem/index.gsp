<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>GiftItem List</title>
</head>
<body>
<div class="body">
    <h1>Unser Wunschbuch</h1>
    <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
    </g:if>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td width="27%" rowspan="4" align="center"><h2>Themenliste / Inhaltsverzeichnis
            </h2>
                <p>&nbsp;</p>
                <h2><a href="${createLink(action:'intro')}">Einleitung</a></h2>
                <h2>&nbsp;</h2>
                <g:each in="${categories}" status="i" var="cat">
                    <h2><g:link action="list" params="[category:cat.name]">${cat.name}</g:link></h2>
                    <h2>&nbsp;</h2>
                </g:each>
                </td>            
        </tr>
        <tr>

            <td align="center"><h2>Einleitung</h2></td>
            <td align="center"><h2>Anleitung</h2></td>
        </tr>
        <tr>
            <td align="center"><h1>Seit nun zwei  Jahren f&uuml;hren wir einen gemeinsamen Haushalt, haben mit M&uuml;he und Not alles  zusammengespart um uns unser Wunschmobiliar zu kaufen und sind nun komplett  eingerichtet.</h1>
                <p>&nbsp;</p>

                <p>&nbsp;</p>
                <h1>Dieser Umstand  macht es uns schwer einen materiellen Wunsch f&uuml;r unsere Hochzeit zu &auml;ussern.  Auch nach langem &Uuml;berlegen ist uns nichts eingefallen, dass wir uns beide  w&uuml;nschen.</h1>
                <p>&nbsp;</p>
                <p>&nbsp;</p>
                <h1>Aus diesem Grund  w&uuml;nschen wir uns einen Beitrag an unsere Flitterwochen in Hawaii und Las Vegas.  Damit k&ouml;nnt Ihr uns die gr&ouml;sste Freude machen!</h1>

                <p>&nbsp;</p></td>
            <td align="center"><h1>Auf  den n&auml;chsten Seiten findet Ihr diverse Dinge, die es braucht damit unsere  Hochzeitsreise &uuml;berhaupt stattfinden kann. Vom Flug bis zum Drink an der Bar  ist so ziemlich alles dabei. Hier ein kurze Beschreibung:</h1>
                <p>&nbsp;</p>                
                <ul>

                    <li>In den leeren Feldern k&ouml;nnt Ihr  beim jeweiligen Thema eine Zahl eingeben, welche dann einem Frankenbetrag  entspricht, den Ihr zu diesem Thema beitragen m&ouml;chtet.</li>
                    <li>Im Warenkorb k&ouml;nnt Ihr sehen,  was Ihr alles ausgew&auml;hlt habt und das stellt dann Eure Unterst&uuml;tzung dar.</li>
                    <li>Wenn Ihr auf &rsquo;&rsquo;Einkaufen&rsquo;&rsquo;  dr&uuml;ckt, wird Euer Geschenkbeitrag gebucht, und unsere Trauzeugen werden mit  Euch Kontakt aufnehmen und Euch das weitere Vorgehen mitteilen.</li>
                </ul>                
                <p>&nbsp;</p>
                <h1>Falls etwas unklar  ist, k&ouml;nnt Ihr &uuml;ber das Kontaktformular bei unseren Trauzeugen nachfragen. Sie  helfen Euch gerne weiter.</h1></td>
        </tr>

        <tr>
            <td align="center"><h1>&nbsp;</h1>
            </td>
            <td align="center"><h1>&nbsp;</h1>
            </td>
        </tr>
    </table>

</div>
</body>
</html>
