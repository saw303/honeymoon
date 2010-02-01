<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title>Erfolgreiche Anmeldung</title>
</head>
<body>
<div id="welcome" class="post">
  <h2 class="title">Anmeldung</h2>
  <div class="story">
    <g:form controller="login" action="login" method="POST">
      Name: <g:textField id="name" name="name"/><br/>
      Passwort: <g:passwordField id="password" name="password"/><br/>
      <g:submitButton name="go" value="Anmelden"/>
    </g:form>
  </div>
</div>
<g:javascript>
  document.getElementById('name').focus();
</g:javascript>
</body>
</html>
