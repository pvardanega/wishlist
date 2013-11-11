package net.pvardanega.wishlist.config;

import com.fasterxml.jackson.jaxrs.json.JacksonJsonProvider;
import javax.ws.rs.ApplicationPath;
import org.glassfish.jersey.server.ResourceConfig;

@ApplicationPath("api")
public class ApplicationConfig extends ResourceConfig {

    public ApplicationConfig() {
        packages("net.pvardanega.wishlist.business", "net.pvardanega.wishlist.common");
        register(JacksonJsonProvider.class);
    }
}
