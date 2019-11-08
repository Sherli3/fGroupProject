package components;

import java.util.EventObject;

public class EventStatus extends EventObject {
    private String status;

    public EventStatus(Object source, String status) {
        super(source);
        actionType(status);

    }
    public void actionType(String status) {
        this.status = status;

    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
