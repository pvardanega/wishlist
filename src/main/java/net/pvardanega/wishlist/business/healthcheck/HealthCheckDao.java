package net.pvardanega.wishlist.business.healthcheck;

import javax.inject.Inject;
import org.jongo.MongoCollection;
import org.springframework.stereotype.Repository;

@Repository
public class HealthCheckDao {

    @Inject
    private MongoCollection usersCollection;

    public boolean isItWorking() {
        usersCollection.count();
        return true;
    }
}
