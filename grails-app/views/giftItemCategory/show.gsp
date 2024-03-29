<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title>Show Category</title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}">Home</a></span>
  <span class="menuButton"><g:link class="list" action="list">Category List</g:link></span>
  <span class="menuButton"><g:link class="create" action="create">New Category</g:link></span>
</div>
<div class="body">
  <h1>Show Category</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="dialog">
    <table>
      <tbody>

      <tr class="prop">
        <td valign="top" class="name">Id:</td>

        <td valign="top" class="value">${category.id}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Name:</td>

        <td valign="top" class="value">${category.name}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Alignment:</td>

        <td valign="top" class="value">${category.alignment}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Gift Items:</td>

        <td valign="top" style="text-align:left;" class="value">
          <ul>
            <g:each var="g" in="${category.giftItems}">
              <li><g:link controller="giftItem" action="show" id="${g.id}">${g}</g:link></li>
            </g:each>
          </ul>
        </td>

      </tr>

      </tbody>
    </table>
  </div>
  <div class="buttons">
    <g:form controller="giftItemCategory">
      <input type="hidden" name="id" value="${category?.id}"/>
      <span class="button"><g:actionSubmit class="edit" value="Edit"/></span>
      <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
    </g:form>
  </div>
</div>
</body>
</html>
