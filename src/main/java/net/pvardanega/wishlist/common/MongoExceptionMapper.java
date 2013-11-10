package net.pvardanega.wishlist.common;

import com.mongodb.MongoException;
import javax.ws.rs.core.Response;
import javax.ws.rs.ext.ExceptionMapper;
import javax.ws.rs.ext.Provider;
import org.springframework.stereotype.Service;

@Service
@Provider
public class MongoExceptionMapper implements ExceptionMapper<MongoException> {

    @Override
    public Response toResponse(MongoException exception) {
        // TODO : log the error
        return Response.serverError().build();
    }
}
