<%@ page import="ch.matssonja.Customer" %>


<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title>Create ShoppingCart</title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}">Home</a></span>
  <span class="menuButton"><g:link class="list" action="list">ShoppingCart List</g:link></span>
</div>
<div class="body">
  <h1>Create ShoppingCart</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${shoppingCart}">
    <div class="errors">
      <g:renderErrors bean="${shoppingCart}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form action="save" method="post">
    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="sessionId">Session Id:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: shoppingCart, field: 'sessionId', 'errors')}">
            <input type="text" id="sessionId" name="sessionId" value="${fieldValue(bean: shoppingCart, field: 'sessionId')}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="sold">Sold:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: shoppingCart, field: 'sold', 'errors')}">
            <g:checkBox name="sold" value="${shoppingCart?.sold}"></g:checkBox>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="items">Items:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: shoppingCart, field: 'items', 'errors')}">

            <ul>
              <g:each var="i" in="${shoppingCart?.items?}">
                <li><g:link controller="cartItem" action="show" id="${i.id}">${i}</g:link></li>
              </g:each>
            </ul>
            <g:link controller="cartItem" params="[" shoppingCart.id":shoppingCart?.id]" action="create">Add CartItem</g:link>

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="customer">Customer:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: shoppingCart, field: 'customer', 'errors')}">
            <g:select optionKey="id" from="${Customer.list()}" name="customer.id" value="${shoppingCart?.customer?.id}" noSelection="['null':'']"></g:select>
          </td>
        </tr>

        </tbody>
      </table>
    </div>
    <div class="buttons">
      <span class="button"><input class="save" type="submit" value="Create"/></span>
    </div>
  </g:form>
</div>
</body>
</html>
