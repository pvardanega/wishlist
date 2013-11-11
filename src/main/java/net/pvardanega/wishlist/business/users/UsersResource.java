package net.pvardanega.wishlist.business.users;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import org.jongo.MongoCollection;
import org.springframework.stereotype.Component;

@Path("/users")
@Component
public class UsersResource {

    @Inject
    private MongoCollection usersCollection;

    @GET
    @Path("/{userId}")
    @Produces(value = MediaType.APPLICATION_JSON)
    public User getUserFromId(@PathParam("userId") Long userId) {
        return usersCollection
                .findOne("{userId: " + userId + "}")
                .as(User.class);
    }

    @POST
    @Path("/{userId}/wishs")
    @Consumes(value = MediaType.APPLICATION_JSON)
    @Produces(value = MediaType.APPLICATION_JSON)
    public Wish addNewWish(@PathParam("userId") Long userId, Wish wish) {
        usersCollection.update("{userId: " + userId + "}").with("{$push: {wishs: #}}", wish);
        return null;
    }

}
