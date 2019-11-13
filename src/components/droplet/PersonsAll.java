package components.droplet;

import atg.apache.xpath.operations.String;
import atg.repository.*;
import atg.repository.rql.RqlStatement;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;
import atg.servlet.DynamoServlet;


import javax.servlet.ServletException;
import java.io.IOException;

public class PersonsAll extends DynamoServlet {

    Repository repository;
    public void service(DynamoHttpServletRequest req, DynamoHttpServletResponse res) throws ServletException, IOException {
        if (repository != null) {
            try {
                RepositoryView view = repository.getView ("user");
                RqlStatement repositoryItem = RqlStatement.parseRqlStatement ("ALL");
                Object params[] = new Object[]{};
                RepositoryItem [] items =repositoryItem.executeQuery (view,params);
                req.setParameter("list", items);
            } catch (RepositoryException e) {
                e.printStackTrace();
            }
        }
        req.serviceParameter("output", req,res);

    }

    public Repository getRepository() {
        return repository;
    }

    public void setRepository(Repository repository) {
        this.repository = repository;
    }
}
