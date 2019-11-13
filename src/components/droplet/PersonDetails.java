package components.droplet;

import atg.repository.Repository;
import atg.repository.RepositoryException;
import atg.repository.RepositoryItem;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;
import atg.servlet.DynamoServlet;

import javax.servlet.ServletException;
import java.io.IOException;

public class PersonDetails extends DynamoServlet {

    Repository repository;

    public void service(DynamoHttpServletRequest req, DynamoHttpServletResponse res) throws ServletException, IOException {
        String userId = req.getParameter("id");
        logDebug("User:   "+userId);
        try {
            RepositoryItem repositoryItem = repository.getItem(userId, "user");
            req.setParameter("element", repositoryItem);
        } catch (RepositoryException e) {
            e.printStackTrace();
        }
        req.serviceParameter("output", req, res);

    }

    public Repository getRepository() {
        return repository;
    }

    public void setRepository(Repository repository) {
        this.repository = repository;
    }
}
