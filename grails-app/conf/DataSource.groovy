dataSource {
    pooled = true
    jmxExport = true
    driverClassName = 'com.mysql.jdbc.Driver'
    username = 'exemplo'
    password = 'exemplo'
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    //    cache.region.factory_class = 'org.hibernate.cache.SingletonEhCacheRegionFactory' // Hibernate 3
    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
    dialect = 'org.hibernate.dialect.MySQL5InnoDBDialect'
    singleSession = true // configure OSIV singleSession mode
    flush.mode = 'manual' // OSIV session flush mode outside of transactional context
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = 'update' // one of 'create', 'create-drop', 'update', 'validate', ''
            url = 'jdbc:mysql://localhost:3306/exemplo'
        }
    }
    test {
        dataSource {
            dbCreate = 'update'
            url = 'jdbc:mysql://0.0.0.0:3306/exemplo'
        }
    }
    production {
        dataSource {
            dbCreate = 'update'
            url = 'jdbc:mysql://192.168.2.20:3306/exemplo'
            properties {
                // See http://grails.org/doc/latest/guide/conf.html#dataSource for documentation
                jmxEnabled = true
                initialSize = 5
                maxActive = -1
                minIdle = 5
                maxIdle = 25
                maxWait = 10000
                maxAge = 10 * 60000
                timeBetweenEvictionRunsMillis = 180000
                minEvictableIdleTimeMillis = 180000
                numTestPerEvictionRun = 3
                validationQuery = 'SELECT 1'
                validationQueryTimeout = 3
                validationInterval = 15000
                testOnBorrow = true
                testWhileIdle = true
                testOnReturn = false
                jdbcInterceptors = 'ConnectionState'
                // defaultTransactionIsolation = java.sql.Connection.TRANSACTION_READ_COMMITTED
            }
        }
    }
}