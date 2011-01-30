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
  <title>Hochzeit von Sabine Berger und Marcel Weber</title>
  <meta name="keywords" content="Sabine Berger Marcel Weber Hochzeit"/>
  <meta name="description" content="Hochzeit von Sabine Berger und Marcel Weber"/>
  <link href="${createLinkTo(dir: 'css', file: 'main.css')}" rel="stylesheet" type="text/css"/>
  <link href="${createLinkTo(dir: 'css', file: 'lightbox.css')}" rel="stylesheet" type="text/css" media="screen"/>
  <link rel="shortcut icon" href="${createLinkTo(dir: 'images', file: 'favicon.ico')}">
</head>
<body>
<div id="logo">&nbsp;</div>
<div id="menu">
  <ul>
    <li class="${params['controller'] == 'home' && params['action'] == 'list' ? 'active' : ''}"><a href="${g.createLink(controller: 'home')}" title="Home">Home</a></li>
    <li class="${params['controller'] == 'home' && params['action'] == 'birdalcouple' ? 'active' : ''}"><a href="${g.createLink(controller: 'home', action: 'birdalcouple')}" title="Sabine und Marcel">Brautpaar</a></li>
    <li class="${params['controller'] == 'home' && params['action'] == 'witness' ? 'active' : ''}"><a href="${g.createLink(controller: 'home', action: 'witness')}" title="Die Trauzeugen">Trauzeugen</a></li>
    <li class="${params['controller'] == 'home' && params['action'] == 'honeymoon' ? 'active' : ''}"><a href="${g.createLink(controller: 'home', action: 'honeymoon')}" title="Die Hochzeit">Hochzeit</a></li>
    <li class="${params['controller'] == 'giftItem'? 'active' : ''}"><a href="${g.createLink(controller: 'giftItem')}" title="Das Wunschbuch">Wunschbuch</a></li>
    <li class="${params['controller'] == 'guestbookEntry'? 'active' : ''}"><a href="${g.createLink(controller: 'guestbookEntry')}" title="Das G&auml;stebuch">G&auml;stebuch</a></li>
    <li class="${params['controller'] == 'shoppingCart'? 'active' : ''}"><a href="${g.createLink(controller: 'shoppingCart')}" title="Der Warenkorb">Warenkorb</a></li>
    <g:if test="${session.user}">
      <li><a href="${g.createLink(controller: 'login', action: 'logout')}" title="Abmelden">Logout</a></li>
    </g:if>
    <li><a href="#">&nbsp;</a></li>
    <li><a href="#">&nbsp;</a></li>
  </ul>
</div>
<div id="content">
  %{--<div id="sidebar">
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
  </div>--}%
  <div id="main">
    <g:layoutBody/>
  </div>
  <div id="extra" style="clear: both;">&nbsp;</div>
</div>
<div id="footer">
  <p id="legal">Designed by <a href="http://www.freecsstemplates.org/">Free CSS Templates</a>. Version <g:meta name="app.version"/> powered by <a href="http://www.grails.org/" target="_blank">Grails</a> <g:meta name="app.grails.version"/></p>
</div>
<script type="text/javascript" src="${createLinkTo(dir: 'js', file: 'prototype.js')}"></script>
<script type="text/javascript" src="${createLinkTo(dir: 'js', file: 'scriptaculous.js?load=effects,builder')}"></script>
<script type="text/javascript" src="${createLinkTo(dir: 'js', file: 'lightbox.js')}"></script>
</body>
</html>
