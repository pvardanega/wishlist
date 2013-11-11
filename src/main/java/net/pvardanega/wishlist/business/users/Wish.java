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
    private final String description;
    private final Double price;

    @JsonCreator
    public Wish(
            @JsonProperty("title") String title,
            @JsonProperty("description") String description,
            @JsonProperty("price") Double price
    ) {
        this.title = title;
        this.description = description;
        this.price = price;
    }
}
