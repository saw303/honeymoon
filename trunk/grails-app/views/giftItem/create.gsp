  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create GiftItem</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">GiftItem List</g:link></span>
        </div>
        <div class="body">
            <h1>Etwas in Wunschbuch schreiben...</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${giftItem}">
            <div class="errors">
                <g:renderErrors bean="${giftItem}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" enctype="multipart/form-data">
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for='name'>Titel / Überschrift:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:giftItem,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:giftItem,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Beschreibung:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:giftItem,field:'description','errors')}">
									<g:textArea name="description" value="${fieldValue(bean:giftItem,field:'description')}" rows="5" cols="40"/>                                    
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="image">Bild:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:giftItem,field:'image','errors')}">
                                    <input type="file" id='image' name='image' value="${fieldValue(bean:giftItem,field:'image')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="price">Preis:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:giftItem,field:'price','errors')}">
									<input type="price" id="price" name="price" value="${fieldValue(bean:giftItem,field:'price')}"/>                                    
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="active">Status:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:giftItem,field:'active','errors')}">
                                    <g:checkBox name="active" value="${giftItem?.active}" ></g:checkBox>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="category">Category:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:giftItem,field:'category','errors')}">
                                    <g:select optionKey="id" from="${Category.list()}" name="category.id" value="${giftItem?.category?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Eintragen"></input></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
