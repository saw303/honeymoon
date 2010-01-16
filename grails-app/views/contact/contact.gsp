<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
   <meta name="layout" content="main"/>
   <title>Einen Trauzeugen kontaktieren</title>
</head>
<body>

<div id="addGbEntry" class="post">
   <h2 class="title">Einen Trauzeugen kontaktieren</h2>
   <div class="story">
      <g:hasErrors bean="${command}">
         <div class="errors">
            <g:renderErrors bean="${command}" as="list"/>
         </div>
      </g:hasErrors>
      <g:form action="send" method="post">
         <fieldset>
            <legend>Email</legend>
            <label for="name">Ihr Name:</label><br/>
            <input type="text" id='name' name='name' value="${fieldValue(bean: command, field: 'name')}"/><br/>
            <label for="email">Ihre Emailadresse:</label><br/>
            <input type="text" id='email' name='email' value="${fieldValue(bean: command, field: 'email')}"/><br/>
            <label for='message'>Ihre Nachricht:</label><br/>
            <g:textArea id='message' name="message" value="${fieldValue(bean:command,field:'message')}" rows="5" cols="40"/><br/>
            <input type="submit" name="sub" value="Anfrage versenden"/>
         </fieldset>
      </g:form>
   </div>
</div>
</body>
</html>
