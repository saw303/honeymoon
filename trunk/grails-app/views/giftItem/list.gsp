<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
   <meta name="layout" content="main"/>

</head>
<body>
<g:if test="${session.user != null}">
   <div class="nav">
      <span class="menuButton"><g:link class="create" action="create">Neuer Wunsch eintragen</g:link></span>
      <span class="menuButton"><g:link class="create" action="create" controller="category">Neue Kategorie eintragen</g:link></span>
   </div>
</g:if>
<div id="xxx"></div>
<g:each in="${resultMap.keySet()}" var="key">
   <div id="outer-wrapper-${key}" class="post" style="overflow:auto">
      <h2 class="title">Kategorie: ${key}</h2>
      <div class="story">
         <div id="inner-wrapper">
            <g:each in="${resultMap.get(key)}" var="giftItem">
               <div style="width:700px;float:left;margin-bottom:10px;">
                  <div id="d1-${giftItem.id}" style="float:left;width:400px">
                     <g:if test="${giftItem.image}"><a href="../${giftItem.image}" rel="lightbox" title="${giftItem.name}" style="text-decoration:none"><h4>${giftItem.name}</h4></a></g:if>
                     <g:else><h4>${giftItem.name}</h4></g:else><br/><span style="text-align:justify;">${giftItem.description}</span>
                  </div>
                  <div id="d2-${giftItem.id}" style="float:right;">
                     <g:formRemote url="[controller:'giftItem', action:'addToChart']" name="form${giftItem.id}"
                        update="xxx" before="toggleSpinner('spinner-${giftItem.id}', true);" after="toggleSpinner('spinner-${giftItem.id}', false);">
                        <input type="hidden" name="id" value="${giftItem.id}"/>
                        <input type="text" name="amount" value="" size="5" maxlength="10"/>&nbsp;Franken
                        <input type="submit" value="In den Warenkorb legen"/>
                     </g:formRemote>
                     <span id="spinner-${giftItem.id}"></span>
                  </div>
               </div>
            </g:each>
         </div>
      </div>
   </div>
</g:each>
<g:javascript>
   function toggleSpinner(elementName, status) {
      document.getElementById(elementName).style.display = status ? 'inline' : 'none';
   }

   function isThisNumeric(value) {
      return !isNaN(value) && value.length > 0;
   }

</g:javascript>
</body>
</html>
