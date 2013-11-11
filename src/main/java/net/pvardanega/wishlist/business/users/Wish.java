package net.pvardanega.wishlist.business.users;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonAutoDetect(
        fieldVisibility = JsonAutoDetect.Visibility.ANY,
        getterVisibility = JsonAutoDetect.Visibility.NONE,
        setterVisibility = JsonAutoDetect.Visibility.NONE
)
public class Wish {

    private final String title;
    private final String link;
    private final String imageLink;
    private final Double price;

    @JsonCreator
    public Wish(
            @JsonProperty("title") String title,
            @JsonProperty("link") String link,
            @JsonProperty("imageLink") String imageLink,
            @JsonProperty("price") Double price
    ) {
        this.title = title;
        this.link = link;
        this.imageLink = imageLink;
        this.price = price;
    }
}
