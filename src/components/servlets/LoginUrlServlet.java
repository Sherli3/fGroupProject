package components.servlets;

import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;
import atg.servlet.pipeline.InsertableServletImpl;

import javax.servlet.ServletException;
import java.io.IOException;

public class LoginUrlServlet extends InsertableServletImpl {

    public LoginUrlServlet() {
    }
    public void service(DynamoHttpServletRequest request, DynamoHttpServletResponse response) throws IOException, ServletException {
        System.out.println("Handling request for " + request.getRequestURI());
        passRequest(request, response);
    }
}
