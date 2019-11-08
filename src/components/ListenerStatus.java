package components;

public class ListenerStatus implements EventStatusListener {

    @Override
    public void statusReceived(EventStatus eventStatus) {
        System.out.println("Status: " + eventStatus.getStatus());
    }
}
