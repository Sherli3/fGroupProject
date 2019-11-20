package components;

import atg.droplet.DropletException;
import atg.repository.MutableRepositoryItem;
import atg.repository.RepositoryException;
import atg.repository.RepositoryItem;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;
import atg.userprofiling.ProfileFormHandler;
import atg.userprofiling.ProfileTools;
import atg.userprofiling.PropertyManager;

import javax.servlet.ServletException;
import java.io.IOException;
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
        RepositoryItem user = findUser(pRequest, pResponse);
        String userId = user.getRepositoryId();
        long timeNow = System.currentTimeMillis();
        try {
            MutableRepositoryItem timeItem = getProfile().getProfileTools().getProfileRepository().getItemForUpdate(userId, "visit");
            if (timeItem == null) {
                timeItem = createVisitTime(userId);
            }
            long checkTime = ((Date) timeItem.getPropertyValue("visitTime")).getTime();
            if (timeNow < checkTime) {
              //  int status = this.checkFormError(this.getLoginErrorURL(), pRequest, pResponse);
                this.addFormException(new DropletException("You not is ok"));
            } else {
                timeItem = setVisitTime(userId);
            }
        } catch (RepositoryException e) {
            e.printStackTrace();
        }

    }

    public MutableRepositoryItem createVisitTime(String userId) {
        long timeNow = System.currentTimeMillis();
        MutableRepositoryItem timeItem = null;
        try {
            timeItem = getProfile().getProfileTools().getProfileRepository().createItem("visit");
            timeItem.setPropertyValue("userId", userId);
            timeItem.setPropertyValue("visitTime", new Date(timeNow + TimeUnit.SECONDS.toMillis(60)));
            timeItem.setPropertyValue("isOk", true);
            getProfileTools().getProfileRepository().addItem(timeItem);
            System.out.println("ITEM VISIT if null : " + timeItem);
            return timeItem;
        } catch (RepositoryException e) {
            e.printStackTrace();
        }
        return timeItem;
    }

    public MutableRepositoryItem setVisitTime(String userId) {
        MutableRepositoryItem timeItem = null;
        long timeNow = System.currentTimeMillis();
        try {
            timeItem = getProfile().getProfileTools().getProfileRepository().getItemForUpdate(userId, "visit");
            timeItem.setPropertyValue("userId", userId);
            timeItem.setPropertyValue("visitTime", new Date(timeNow + TimeUnit.SECONDS.toMillis(60)));
            timeItem.setPropertyValue("isOk", true);
            getProfileTools().getProfileRepository().updateItem(timeItem);
            return timeItem;
        } catch (RepositoryException e) {
            e.printStackTrace();
        }
        return timeItem;
    }


    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }
}
