package net.pvardanega.wishlist.config;

import com.mongodb.DB;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import java.net.UnknownHostException;
import net.pvardanega.wishlist.common.MongoUnreachableException;
import org.jongo.Jongo;
import org.jongo.MongoCollection;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan("net.pvardanega.wishlist")
public class SpringConfig {

    @Bean(name = "usersCollection")
    public MongoCollection getUsersCollection() {
        DB db = null;
        MongoClientURI mongohq_url = new MongoClientURI(System.getProperty("MONGOHQ_URL"));
        try {
            db = new MongoClient(mongohq_url).getDB(mongohq_url.getDatabase());
            db.authenticate(mongohq_url.getUsername(), mongohq_url.getPassword());
        } catch (UnknownHostException e) {
            throw new MongoUnreachableException(e);
        }
        Jongo jongo = new Jongo(db);
        return jongo.getCollection("users");
    }
}
