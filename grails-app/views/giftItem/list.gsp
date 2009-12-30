<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
   <meta name="layout" content="main"/>
   <g:javascript library="prototype"/>

   <script type="text/javascript">
      function toggleSpinner(elementName, status) {
      document.getElementById(elementName).style.display = status ? 'inline':'none';
      }

      function isThisNumeric(value) {
      alert(value)
      return !isNaN(value) && value.length > 0;
      }
   </script>
</head>
<body>
<g:if test="${session.user != null}">
   <div class="nav">
      <span class="menuButton"><g:link class="create" action="create">Neuer Wunsch eintragen</g:link></span>
      <span class="menuButton"><g:link class="create" action="create" controller="category">Neue Kategorie eintragen</g:link></span>
   </div>
</g:if>
<div id="main" class="post">
   <g:each in="${resultMap.keySet()}" var="key">
      <h2 class="title">${key}</h2>
      <div class="story">
         <g:each in="${resultMap.get(key)}" var="giftItem">
            <p>${giftItem.name}</p>
         </g:each>
      </div>
   </g:each>
</div>
</body>
</html>
