package components.controllers;

import atg.servlet.DynamoHttpServletRequest;
import atg.userprofiling.AccessController;
import atg.userprofiling.Profile;

public class AccessLoginController implements AccessController {
    @Override
    public boolean allowAccess(Profile profile, DynamoHttpServletRequest dynamoHttpServletRequest) {
        return false;
    }

    @Override
    public String getDeniedAccessURL(Profile profile) {
        return null;
    }
}
