dataSource {
    pooled = true
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
            driverClassName = "org.h2.Driver"
            username = "sa"
            password = ""
        }
    }
    test {
        dataSource {
            dbCreate = "create-drop"
	        url = "[[jdbc:cloudbees://wishlist-db-test]]"
            driverClassName = "com.cloudbees.jdbc.Driver"
            username = "wish-test"
            password = "list"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
	        url = "[[jdbc:cloudbees://wishlist-db]]"
            driverClassName = "com.cloudbees.jdbc.Driver"
            username = "wish"
            password = "list"
            pooled = true
            properties {
               maxActive = -1
               minEvictableIdleTimeMillis=1800000
               timeBetweenEvictionRunsMillis=1800000
               numTestsPerEvictionRun=3
               testOnBorrow=true
               testWhileIdle=true
               testOnReturn=true
               validationQuery="SELECT 1"
            }
        }
    }
}
