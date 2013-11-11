package net.pvardanega.wishlist.business.healthcheck;

import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import org.springframework.stereotype.Component;

@Path("/check")
@Component
public class HealthCheckResource {

    @Inject
    private HealthCheckDao healthCheckDao;

    @GET
    public boolean isItWorking() {
        return healthCheckDao.isItWorking();
    }
}
