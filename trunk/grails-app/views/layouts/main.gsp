<html>
    <head>
        <title><g:layoutTitle default="lebensl&auml;nglich.ch - Die Hochzeit von Daniela Wangler und Stefan Dolder" /></title>
        <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />				
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${createLinkTo(dir:'images',file:'spinner.gif')}" alt="Spinner" />
        </div>	
        <div class="logo">
			<p>&nbsp;</p>
			<img src="${createLinkTo(dir:'images/Homepagebilder',file:'Titelleistenbild_1.jpg')}" alt="Daniel und Stefan heiraten" />
		</div>
        <div class="nav">
            <span class="menuButton"><g:link class="home" action="list" controller="home">Home</g:link></span>
            <span class="menuButton"><g:link action="birdalcouple" controller="home">Daniela & Stefan</g:link></span>
			<span class="menuButton"><g:link action="wedding" controller="home">Die Trauung</g:link></span>
            <span class="menuButton"><g:link action="witness" controller="home">Die Trauzeugen</g:link></span>			
            <span class="menuButton"><g:link class="list" controller="giftItem">Wunschbuch</g:link></span>
            <span class="menuButton"><g:link class="list" action="list" controller="guestbookEntry">G&auml;stebuch</g:link></span>
            <span class="menuButton"><g:link action="list" controller="shoppingCart">Warenkorb</g:link></span>
			<g:if test="${session.user != null}">
				<span class="menuButton"><g:link action="logout" controller="login">Abmelden</g:link></span>
			</g:if>
			<g:if test="${session.user == null}">
				<span class="menuButton"><g:link controller="login">Anmelden</g:link></span>
			</g:if>
        </div>
        <g:layoutBody />
        <div class="footer"><g:meta name="app.name"/> (Version <g:meta name="app.version"/>) powered by <a href="http://www.grails.org/">Grails</a> <g:meta name="app.grails.version" /></div>
    </body>	
</html>