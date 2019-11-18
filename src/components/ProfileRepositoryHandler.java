package components;

import atg.repository.MutableRepositoryItem;
import atg.repository.RepositoryException;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;
import atg.userprofiling.ProfileFormHandler;

import javax.servlet.ServletException;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

public class ProfileRepositoryHandler extends ProfileFormHandler {
    private String role;
    protected void postCreateUser(DynamoHttpServletRequest pRequest, DynamoHttpServletResponse pResponse) throws ServletException, IOException {
       /* Set<MutableRepositoryItem> roles = new HashSet<>();
        try {
            MutableRepositoryItem item= getProfile().getProfileTools().getProfileRepository().getItemForUpdate("role", role);
            item.setPropertyValue("role", roles);
            roles.add(item);

        } catch (RepositoryException e) {
            e.printStackTrace();
        }

*/

    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
