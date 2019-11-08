package components;

import java.util.HashMap;
import java.util.Map;

public class Configuration {
    private Map<String,String> eventsMap = new HashMap();

    public Map<String, String> getEventsMap() {
        return eventsMap;
    }

    public void setEventsMap(Map<String, String> eventsMap) {
        this.eventsMap = eventsMap;
    }
}
