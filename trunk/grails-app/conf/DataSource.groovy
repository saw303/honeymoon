dataSource {
  pooled = false
  username = "maese"
  password = "maese"
  url = "jdbc:mysql://127.0.0.1/maese"
  driverClassName = "com.mysql.jdbc.Driver"
}
hibernate {
  cache.use_second_level_cache = true
  cache.use_query_cache = true
  cache.provider_class = 'org.hibernate.cache.EhCacheProvider'
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
      dbCreate = "create-drop"
      dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
    }
  }
  production {
    dataSource {
      dbCreate = "update"
      jndiName = "jdbc/maese"
      dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
    }
  }
}