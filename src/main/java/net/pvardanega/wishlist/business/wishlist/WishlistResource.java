package net.pvardanega.wishlist.business.wishlist;

import java.util.Arrays;
import java.util.List;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import org.bson.types.ObjectId;

@Path("/users/{user-id}/wishlist")
public class WishlistResource {

    @GET
    @Produces(value = MediaType.APPLICATION_JSON)
    public List<Wish> getWishListOf(@PathParam("user-id") Long userId) {

        return Arrays.asList(
                new Wish(new ObjectId(), "Bacpac GoPro", "Batterie supplémentaire permettant de plus de doubler la " +
                        "batterie de votre gopro", 59.90),
                new Wish(new ObjectId(), "Remote", "Nouveau livre de 37 signals sur le remote working", 16.85)
        );
    }

}
