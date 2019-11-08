package components;

import java.util.EventListener;

public interface EventStatusListener extends EventListener {

    public void statusReceived(EventStatus eventStatus);
}
