package net.pvardanega.wishlist.config;

import com.mongodb.DB;
import com.mongodb.Mongo;
import java.net.UnknownHostException;
import net.pvardanega.wishlist.common.MongoUnreachableException;
import org.jongo.Jongo;
import org.jongo.MongoCollection;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan("net.pvardanega.wishlist.business")
public class SpringConfig {

    @Bean(name = "usersCollection")
    public MongoCollection getUsersCollection() {
        DB db = null;
        try {
            db = new Mongo().getDB("wishlist");
        } catch (UnknownHostException e) {
            throw new MongoUnreachableException(e);
        }
        Jongo jongo = new Jongo(db);
        return jongo.getCollection("users");
    }
}
