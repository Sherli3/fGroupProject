package components.repository;

import atg.repository.MutableRepositoryItem;
import atg.repository.RepositoryException;
import atg.repository.servlet.RepositoryFormHandler;

import javax.servlet.ServletException;
import java.io.IOException;
import java.util.*;

public class RepositoryFormHandlersPersonEdit extends RepositoryFormHandler {
    private String[] mentors;

    protected void postUpdateItemProperties(MutableRepositoryItem pItem) throws ServletException, IOException {
        try {
            Set<MutableRepositoryItem> mentorList = new HashSet<>();
            for (String mentorId : mentors) {
                MutableRepositoryItem itemMentor = this.getRepository().getItemForUpdate(mentorId, "user");
                mentorList.add(itemMentor);
            }
            pItem.setPropertyValue("mentorUser1", mentorList);

        } catch (RepositoryException e) {
            e.printStackTrace();
        }

        super.postUpdateItemProperties(pItem);

    }

    public String[] getMentors() {
        return mentors;
    }

    public void setMentors(String[] mentors) {
        this.mentors = mentors;
    }
}
