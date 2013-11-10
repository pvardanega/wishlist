package net.pvardanega.wishlist.business.wishlist;

import org.bson.types.ObjectId;
import org.codehaus.jackson.annotate.JsonAutoDetect;
import org.codehaus.jackson.annotate.JsonCreator;
import org.codehaus.jackson.annotate.JsonProperty;

@JsonAutoDetect(
        fieldVisibility = JsonAutoDetect.Visibility.ANY,
        getterVisibility = JsonAutoDetect.Visibility.NONE,
        setterVisibility = JsonAutoDetect.Visibility.NONE
)
public class Wish {

    private final ObjectId _id;
    private final String title;
    private final String description;
    private final Double price;

    @JsonCreator
    public Wish(
            @JsonProperty("title") ObjectId _id,
            @JsonProperty("title") String title,
            @JsonProperty("description") String description,
            @JsonProperty("price") Double price
    ) {
        this._id = _id;
        this.title = title;
        this.description = description;
        this.price = price;
    }
}
