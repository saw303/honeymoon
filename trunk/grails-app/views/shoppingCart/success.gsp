<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />		
    </head>
    <body>        
        <div class="body">
            <h2>Gratulation</h2>
            
            <div>Ihr Hochzeitsgeschenk konnte erfolgreich an die Trauzeugen &uuml;bermittelt werden.</div>
			
			<div>
				<table>					
					<tbody>
						<tr>
							<td>Name</td>
							<td>${cart.customer.firstName} ${cart.customer.lastName}</td>
						</tr>
						<tr>
							<td>Strasse</td>
							<td>${cart.customer.firstName} ${cart.customer.addressLine}</td>
						</tr>
						<tr>
							<td>PLZ / Ort</td>
							<td>${cart.customer.postCode} ${cart.customer.city}</td>
						</tr>
						<tr>
							<td>Ihr Geschenk</td>
							<td>${total} Franken</td>
						</tr>
					</tbody>
				</table>
			</div>
        </div>
    </body>
</html>
