package net.pvardanega.wishlist.business.healthcheck;

import org.springframework.stereotype.Repository;

@Repository
public class HealthCheckDao {

    public boolean isItWorking() {
        return false;
    }
}
