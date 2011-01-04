

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show ShoppingCart</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">ShoppingCart List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New ShoppingCart</g:link></span>
        </div>
        <div class="body">
            <h1>Show ShoppingCart</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${shoppingCart.id}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Session Id:</td>
                            
                            <td valign="top" class="value">${shoppingCart.sessionId}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Sold:</td>
                            
                            <td valign="top" class="value">${shoppingCart.sold}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Items:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="i" in="${shoppingCart.items}">
                                    <li><g:link controller="cartItem" action="show" id="${i.id}">${i}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Customer:</td>
                            
                            <td valign="top" class="value"><g:link controller="customer" action="show" id="${shoppingCart?.customer?.id}">${shoppingCart?.customer}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form controller="shoppingCart">
                    <input type="hidden" name="id" value="${shoppingCart?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
