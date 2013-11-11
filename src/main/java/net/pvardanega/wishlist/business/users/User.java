package net.pvardanega.wishlist.business.users;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import java.util.List;
import org.bson.types.ObjectId;

@JsonAutoDetect(
        fieldVisibility = JsonAutoDetect.Visibility.ANY,
        getterVisibility = JsonAutoDetect.Visibility.NONE,
        setterVisibility = JsonAutoDetect.Visibility.NONE
)
public class User {

    private final ObjectId _id;
    private final Long userId;
    private final List<Wish> wishs;

    @JsonCreator
    public User(
            @JsonProperty("_id") ObjectId _id,
            @JsonProperty("userId") Long userId,
            @JsonProperty("wishs") List<Wish> wishs
    ) {
        this._id = _id;
        this.userId = userId;
        this.wishs = wishs;
    }
}
