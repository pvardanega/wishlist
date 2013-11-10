package net.pvardanega.wishlist.config;

import javax.ws.rs.ApplicationPath;
import org.glassfish.jersey.jackson.JacksonFeature;
import org.glassfish.jersey.server.ResourceConfig;

@ApplicationPath("api")
public class ApplicationConfig extends ResourceConfig {

    public ApplicationConfig() {
        packages("net.pvardanega.wishlist.business");
        register(JacksonFeature.class);
    }
}
