package components;

import atg.repository.MutableRepositoryItem;
import atg.repository.RepositoryException;
import atg.repository.RepositoryItem;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;
import atg.userprofiling.ProfileFormHandler;
import atg.userprofiling.ProfileTools;
import atg.userprofiling.PropertyManager;
import com.sun.jmx.mbeanserver.Repository;

import javax.servlet.ServletException;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.TimeUnit;

public class ProfileRepositoryHandler extends ProfileFormHandler {
    private String roleId;

    protected void postCreateUser(DynamoHttpServletRequest pRequest, DynamoHttpServletResponse pResponse) throws ServletException, IOException {
        Set<MutableRepositoryItem> roles = new HashSet<>();
        try {
            MutableRepositoryItem item = getProfile().getProfileTools().getProfileRepository().getItemForUpdate(roleId, "role");
            roles.add(item);
            MutableRepositoryItem mutableRepositoryItem = getProfile().getProfileTools().getProfileRepository().
                    getItemForUpdate(getRepositoryId(), getCreateProfileType());
            mutableRepositoryItem.setPropertyValue("roles", roles);
        } catch (RepositoryException e) {
            e.printStackTrace();
        }

    }

    protected void preLoginUser(DynamoHttpServletRequest pRequest, DynamoHttpServletResponse pResponse) throws ServletException, IOException {
        RepositoryItem user= findUser(pRequest,pResponse);
        String userId= user.getRepositoryId();
        long timeNow = System.currentTimeMillis();
        try {
            MutableRepositoryItem item = getProfile().getProfileTools().getProfileRepository().getItemForUpdate(userId, "user");
            MutableRepositoryItem timeItem =getProfile().getProfileTools().getProfileRepository().getItemForUpdate(userId,"visit");
            if(timeItem==null){
                timeItem =getProfile().getProfileTools().getProfileRepository().createItem("visit");
                timeItem.setPropertyValue("userId", userId);
                timeItem.setPropertyValue("visitTime", new Date(timeNow));
                timeItem.setPropertyValue("isOk", true);
                getProfileTools().getProfileRepository().addItem(timeItem);
                System.out.println("ITEM VISIT if null : "+ timeItem);

            }
            System.out.println("ITEM USER: "+ item);
            timeItem.setPropertyValue("userId", userId);
            timeItem.setPropertyValue("visitTime", new Date(timeNow));
            timeItem.setPropertyValue("isOk", true);
            getProfileTools().getProfileRepository().updateItem(timeItem);
        }
        catch (RepositoryException e) {
            e.printStackTrace();
        }

        ProfileTools ptools = this.getProfileTools();
        PropertyManager pmgr = ptools.getPropertyManager();
        String loginPropertyName = pmgr.getLoginPropertyName();
        String login = this.getStringValueProperty(loginPropertyName);
        System.out.println("LOGIN: " +login);

    }


    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }
}
