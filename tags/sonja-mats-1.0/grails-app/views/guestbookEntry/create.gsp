<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
   <meta name="layout" content="main"/>
</head>
<body>
<div id="addGbEntry" class="post">
   <h2 class="title">Erstellen Sie einen neuen G&auml;stebucheintrag</h2>
   <g:if test="${flash.message}">
      <div class="boxed"><div class="content">${flash.message}</div></div>
   </g:if>
   <g:hasErrors bean="${guestbookEntry}">
      <div class="boxed">
         <g:renderErrors bean="${guestbookEntry}" as="list"/>
      </div>
   </g:hasErrors>
   <div class="content">
      <g:form action="save" method="post">
         <fieldset>
            <legend>G&auml;stebucheintrag schreiben</legend>
            <label for='author'>Ihr Name:</label>
            <br/>
            <input type="text" id='author' name='author' value="${fieldValue(bean: guestbookEntry, field: 'author')}"/>
            <br/>
            <label for='authorEmail'>Ihre Email:</label>
            <br/>
            <input type="text" id='authorEmail' name='authorEmail' value="${fieldValue(bean: guestbookEntry, field: 'authorEmail')}"/>
            <br/>
            <label for='title'>Titel des Eintrags:</label>
            <br/>
            <input type="text" id='title' name='title' value="${fieldValue(bean: guestbookEntry, field: 'title')}"/>
            <br/>
            <label for='message'>Ihre Nachricht:</label>
            <br/>
            <g:textArea name="message" value="${fieldValue(bean:guestbookEntry,field:'message')}" rows="5" cols="40"/>
            <br/>
            <label for='message'>Anti Spam Code:</label>
            <br/>
            <img src="${createLink(controller: 'captcha', action: 'index')}"/>
            <br/>
            <input type="text" id='captcha' name='captcha' value=""/>
            <br/>
            <input id="inputsubmit1" type="submit" name="inputsubmit1" value="Ins G&auml;stebuch eintragen"/>
         </fieldset>
      </g:form>
   </div>
</div>
</body>
</html>
