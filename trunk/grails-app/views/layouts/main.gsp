<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by Free CSS Templates
http://www.freecsstemplates.org
Released for free under a Creative Commons Attribution 2.5 License

Modified by Silvio Wangler
http://www.silviowangler.ch
-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
   <title>Hochzeit von Sonja und Matthias</title>
   <meta name="keywords" content="Matthias Stulz Sonja Müller Hochzeit"/>
   <meta name="description" content="Hochzeit von Sonja Stulz-Müller und Matthias Stulz"/>
   <link href="${createLinkTo(dir: 'css', file: 'main.css')}" rel="stylesheet" type="text/css"/>
</head>
<body>
<div id="logo">
   <h1><a href="#"><span>Hochzeit von </span>Sonja &amp; Matthias</a></h1>
</div>
<div id="menu">
   <ul>
      <li class="active"><a href="${g.createLink(controller: 'home')}" title="">Home</a></li>
      <li><a href="${g.createLink(controller: 'home', action:'birdalcouple')}" title="">Sonja &amp; Matthias</a></li>
      <li><a href="${g.createLink(controller: 'home', action: 'witness')}" title="">Trauzeugen</a></li>
      <li><a href="${g.createLink(controller: 'giftItem')}" title="">Wunschbuch</a></li>
      <li><a href="${g.createLink(controller: 'guestbookEntry')}" title="">G&auml;stebuch</a></li>
      <li><a href="${g.createLink(controller: 'shoppingCart')}" title="">Warenkorb</a></li>
   </ul>
</div>
<div id="content">
   <div id="sidebar">
      <g:if test="${!session.user}">
         <div id="login" class="boxed">
            <h2 class="title">Administration</h2>
            <div class="content">
               <g:form controller="login" action="login" method="post">
                  <fieldset>
                     <legend>Anmelden</legend>
                     <label for="name">Benutzername:</label>
                     <input id="name" type="text" name="name" value="${fieldValue(bean: cmd, field: 'name')}"/>
                     <label for="password">Passwort:</label>
                     <input id="password" type="password" name="password" value="${fieldValue(bean: cmd, field: 'password')}"/>
                     <input id="inputsubmit1" type="submit" name="inputsubmit1" value="Anmelden"/>
                  </fieldset>
               </g:form>
            </div>
         </div>
      </g:if>
      <g:else>
         <div id="login" class="boxed">
            <h2 class="title">Administation (${session.user?.generateFullName()})</h2>
            <div class="content">
               <ul>
                  <li><a href="${g.createLink(controller: 'guestbookEntry')}">G&auml;stebuch verwalten</a></li>
                  <li><a href="${g.createLink(controller: 'giftItem')}">Wunschbuch verwalten</a></li>
                  <li><a href="${g.createLink(controller: 'login', action: 'logout')}">Abmelden</a></li>
               </ul>
            </div>
         </div>
      </g:else>
   </div>
   <div id="main">
      <g:layoutBody/>
   </div>
   <div id="extra" style="clear: both;">&nbsp;</div>
</div>
<div id="footer">
   <p id="legal">Designed by <a href="http://www.freecsstemplates.org/">Free CSS Templates</a>. Version <g:meta name="app.version"/> powered by <a href="http://www.grails.org/">Grails</a> <g:meta name="app.grails.version"/></p>
</div>
</body>
</html>
