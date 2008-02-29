dataSource {
	pooled = false		
}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class='org.hibernate.cache.EhCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
			username = "sa"
			password = ""
			driverClassName = "org.hsqldb.jdbcDriver"
			dbCreate = "create-drop" // one of 'create', 'create-drop','update'
			url = "jdbc:hsqldb:mem:devDB"
		}
	}
	test {
		dataSource {
			username = "sa"
			password = ""
			driverClassName = "org.hsqldb.jdbcDriver"
			dbCreate = "update"
			url = "jdbc:hsqldb:mem:testDb"
		}
	}
	production {
		dataSource {
			dbCreate = "update"						
			driverClassName = "com.mysql.jdbc.Driver"
			dialect = "org.hibernate.dialect.MySQLInnoDBDialect"
			username = "lebenslaenglich"
			password = "*Life+Long*"
			url = "jdbc:mysql://localhost/lebenslaenglich"
		}
	}
}