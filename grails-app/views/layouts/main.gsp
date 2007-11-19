<html>
    <head>
        <title><g:layoutTitle default="lebenslänglich.ch - Die Hochzeit von Daniela Wangler und Stefan Dolder" /></title>
        <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />				
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${createLinkTo(dir:'images',file:'spinner.gif')}" alt="Spinner" />
        </div>	
        <div class="logo"><img src="${createLinkTo(dir:'images',file:'grails_logo.jpg')}" alt="Grails" /></div>
        <div class="nav">
            <span class="menuButton"><g:link class="home" action="list" controller="home">Home</g:link></span>
            <span class="menuButton"><g:link action="list" controller="home">Daniela & Stefan</g:link></span>
            <span class="menuButton"><g:link action="list" controller="home">Die Trauzeugen</g:link></span>
            <span class="menuButton"><g:link class="list" action="list" controller="giftItem">Wunschbuch</g:link></span>
            <span class="menuButton"><g:link class="list" action="list" controller="guestbookEntry">Gästebuch</g:link></span>
            <span class="menuButton"><g:link action="list" controller="guestbookEntry">Warenkorb</g:link></span>
        </div>
        <g:layoutBody />
        <div>Version <g:meta name="app.version"/> on Grails <g:meta name="app.grails.version" /></div>
    </body>	
</html>