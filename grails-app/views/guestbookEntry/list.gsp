<%@ page import="ch.matsonja.GuestbookEntry" %>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
   <meta name="layout" content="main"/>
   <title>GuestbookEntry List</title>

   <style type="text/css">
   .gbook {
      border: 1px solid #FFFFFF;
   }
   </style>
</head>
<body>
<g:if test="${flash.message}">
   <div class="message">${flash.message?.encodeAsHTML()}</div>
</g:if>
<div class="post">
   <span class="menuButton"><g:link class="create" action="create">Tragen Sie sich auch ins G&auml;stebuch ein</g:link></span>
</div>
<g:each in="${guestbookEntryList}" status="i" var="guestbookEntry">
   <div id="entry-${guestbookEntry.id}" class="post">

      <h3 class="date"><span class="month">Mar.</span> <span class="day"><g:formatDate format="dd" date="${guestbookEntry.entryDate}"/></span><span class="year">, 2007</span></h3>
      <div class="meta">
         <p>Geschrieben von ${guestbookEntry.author?.encodeAsHTML()} um <g:formatDate format="HH:mm" date="${guestbookEntry.entryDate}"/> Uhr <br/>(${guestbookEntry.authorEmail?.replace('@', ' at ').replace('.', ' dot ').encodeAsHTML()})</p>
      </div>
      <h2 class="title">${guestbookEntry.title?.encodeAsHTML()}</h2>
      <div class="story">
         <p>${guestbookEntry.message?.encodeAsHTML()}</p>
      </div>
      <g:if test="${session.user != null}">
         <tr>
            <td><a href="<g:createLink action="delete" id="${guestbookEntry.id}"/>">L&ouml;schen</a></td>
         </tr>
      </g:if>
   </div>
</g:each>
<div class="paginateButtons">
   <g:paginate total="${GuestbookEntry.count()}"/>
</div>
</body>
</html>
