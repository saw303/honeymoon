<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title>Erfolgreiche Anmeldung</title>
</head>
<body>
<div id="welcome" class="post">
  <h2 class="title">Anmeldung erfolgreich durchgef&uuml;hrt</h2>
  <div class="story">
    <p>Hallo ${session.user.generateFullName()}. Sch&ouml;n Dich auf dieser Seite begr&uuml;ssen zu k&ouml;nnen.</p>
    <p>Als angemeldeter Benutzer kannst Du folgendes tun:</p>
    <p>
    <ul>
      <li><g:link controller="guestbookEntry" action="index">G&auml;stebuch verwalten</g:link></li>
      <li><g:link controller="giftItem" action="index">Wunschbuch verwalten</g:link></li>
    </ul>
  </p>
  </div>
</div>
</body>
</html>
