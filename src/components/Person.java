package components;

import atg.droplet.GenericFormHandler;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;

public class Person extends GenericFormHandler {
    private Configuration configuration;
    private String status;
    private ListenerStatus listenerStatus;

    public boolean handleAction(DynamoHttpServletRequest pRequest, DynamoHttpServletResponse pResponse) {
        String key = pRequest.getParameter("status");
        listenerStatus.statusReceived(new EventStatus(this, key));
        setStatus(configuration.getEventsMap().get(key));
        return true;
    }

    public Configuration getConfiguration() {
        return configuration;
    }

    public void setConfiguration(Configuration configuration) {
        this.configuration = configuration;
    }

    public ListenerStatus getListenerStatus() {
        return listenerStatus;
    }

    public void setListenerStatus(ListenerStatus listenerStatus) {
        this.listenerStatus = listenerStatus;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
