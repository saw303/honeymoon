<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title>Edit Category</title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}">Home</a></span>
  <span class="menuButton"><g:link class="list" action="list">Category List</g:link></span>
  <span class="menuButton"><g:link class="create" action="create">New Category</g:link></span>
</div>
<div class="body">
  <h1>Edit Category</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${category}">
    <div class="errors">
      <g:renderErrors bean="${category}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form controller="giftItemCategory" method="post">
    <input type="hidden" name="id" value="${category?.id}"/>
    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="name">Name:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: category, field: 'name', 'errors')}">
            <input type="text" maxlength="100" id="name" name="name" value="${fieldValue(bean: category, field: 'name')}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="alignment">Alignment:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: category, field: 'alignment', 'errors')}">
            <g:select from="${1..100}" id="alignment" name="alignment" value="${category?.alignment}"></g:select>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="giftItems">Gift Items:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: category, field: 'giftItems', 'errors')}">

            <ul>
              <g:each var="g" in="${category?.giftItems?}">
                <li><g:link controller="giftItem" action="show" id="${g.id}">${g}</g:link></li>
              </g:each>
            </ul>
            <g:link controller="giftItem" params="[" category.id":category?.id]" action="create">Add GiftItem</g:link>

          </td>
        </tr>

        </tbody>
      </table>
    </div>
    <div class="buttons">
      <span class="button"><g:actionSubmit class="save" value="Update"/></span>
      <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
    </div>
  </g:form>
</div>
</body>
</html>
