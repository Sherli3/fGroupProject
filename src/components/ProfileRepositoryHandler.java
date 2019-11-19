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
    private String roleId;

    protected void postCreateUser(DynamoHttpServletRequest pRequest, DynamoHttpServletResponse pResponse) throws ServletException, IOException {
        Set<MutableRepositoryItem> roles = new HashSet<>();
        try {
            MutableRepositoryItem item= getProfile().getProfileTools().getProfileRepository().getItemForUpdate(roleId, "role");
            roles.add(item);
            MutableRepositoryItem mutableRepositoryItem =getProfile().getProfileTools().getProfileRepository().
                    getItemForUpdate(getRepositoryId(), getCreateProfileType());
            mutableRepositoryItem.setPropertyValue("roles", roles);
        } catch (RepositoryException e) {
            e.printStackTrace();
        }

    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }
}
