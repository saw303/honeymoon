<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>

</head>
<body>
<g:if test="${session.user != null}">
  <div class="nav">
    <span class="menuButton"><g:link class="create" action="create">Neuer Wunsch eintragen</g:link></span>
    <span class="menuButton"><g:link class="create" action="create" controller="giftItemCategory">Neue Kategorie eintragen</g:link></span>
  </div>
</g:if>
<div id="notice"></div>
<div class="post">
  <h2 class="title">Unser Wunschbuch</h2>
  <div class="story">
    <p>Wir pflegen seit längerer Zeit einen gemeinsamen Haushalt und sind fast vollständig eingerichtet. Mit einem Eigenheim möchten wir uns in näherer Zukunft einen Traum verwirklichen.</p>
    <p>Wir bereisen oft und viel die Welt. Wir besuchen gerne Freunde in New Zealand oder geniessen schönste Familienabende in Florida. Auch würden wir gerne wieder zurück nach Fremantle gehen.</p>
    <p>Liebe Freunde ihr seht, an Ideen fehlt es uns nicht. Höchstens die Zeit wird knapp. Untenstehen dürft ihr einen Beitrag an unsere Ideen leisten. Wir werden alle realisieren, vielleicht nur nicht alle miteinander. Wir werden es euch aber auf jeden Fall wissen lassen.</p>
    <p>Möchtet ihr uns lieber etwas persönliches schenken, wendet euch bitte an unsere <g:link controller="contact" action="witness">Trauzeugen</g:link>.</p>
    <p>Wir freuen uns über alles aber vergesst nie, dass ihr auch ohne Geschenke herzlich Willkommen seit.</p>
  </div>

</div>

<g:each in="${resultMap.keySet()}" var="cat">
  <div id="outer-wrapper-${cat.id}" class="post" style="overflow:auto">
    <h2 class="title">${cat.name.encodeAsHTML()}
    <g:if test="${session.user}">
      <g:link action="edit" controller="giftItemCategory" id="${cat.id}">&lt;Kategorie bearbeiten&gt;</g:link>
    </g:if>
    </h2>
    <div class="story">
      <div id="inner-wrapper">
        <g:each in="${resultMap.get(cat)}" var="giftItem">
          <div style="width:700px;float:left;margin-bottom:10px;">
            <div id="d1-${giftItem.id}" style="float:left;width:400px">
              <g:if test="${giftItem.image?.trim().length() > 0}"><a href="${g.createLink(action: 'image', id: giftItem.id)}" rel="lightbox" title="${giftItem.name}" style="text-decoration:none"><h4>${giftItem.name}</h4></a></g:if>
              <g:else><h4>${giftItem.name}</h4></g:else>
              <g:if test="${session.user}">
                <g:link action="edit" controller="giftItem" id="${giftItem.id}">&lt;Wunsch bearbeiten&gt;</g:link>
              </g:if>
              <br/><span style="text-align:justify;">${giftItem.description}</span>

            </div>
            <div id="d2-${giftItem.id}" style="float:right;">
              <g:formRemote url="[controller:'giftItem', action:'addToChart']" name="form${giftItem.id}"
                      update="notice" before="toggleSpinner('spinner-${giftItem.id}', true);" after="toggleSpinner('spinner-${giftItem.id}', false);">
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
