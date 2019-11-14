package components.repository;

import atg.repository.MutableRepositoryItem;
import atg.repository.RepositoryException;
import atg.repository.RepositoryItem;
import atg.repository.servlet.RepositoryFormHandler;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;

import javax.servlet.ServletException;
import java.io.IOException;
import java.util.*;

public class RepositoryFormHandlersPersonEdit extends RepositoryFormHandler {
    private String[] mentors;
    private String person;
    private String idMentor;

    protected void postUpdateItemProperties(MutableRepositoryItem pItem) throws ServletException, IOException {
        try {
            Set<MutableRepositoryItem> mentorList = new HashSet<>();
            for (String mentorId : mentors) {
                MutableRepositoryItem itemMentor = this.getRepository().getItemForUpdate(mentorId, "user");
                mentorList.add(itemMentor);
            }
            pItem.setPropertyValue("mentor", mentorList);

        } catch (RepositoryException e) {
            e.printStackTrace();
        }

        super.postUpdateItemProperties(pItem);

    }


    public boolean handleDelete(DynamoHttpServletRequest pRequest, DynamoHttpServletResponse pResponse) throws ServletException, IOException {
        try {
            logDebug("MENTOR ID: " + person);
            logDebug("PERSON ID: " + idMentor);
            MutableRepositoryItem person = this.getRepository().getItemForUpdate(idMentor, "user");
            Set<RepositoryItem> mentors = (Set<RepositoryItem>) person.getPropertyValue("mentor");
            for (RepositoryItem mentor : mentors) {
                logDebug("MENTOR CHECKED ID: " + mentor.getRepositoryId() );
                if(mentor.getRepositoryId().equals(this.person)) {
                    logDebug("EQUALS!!!! ");
                    mentors.remove(mentor);
                }
            }
            person.setPropertyValue("mentor", mentors);
            this.getRepository().updateItem(person);


        } catch (RepositoryException e) {
            e.printStackTrace();
        }
        return true;

    }

    public String getIdMentor() {
        return idMentor;
    }

    public void setIdMentor(String idMentor) {
        this.idMentor = idMentor;
    }

    public String[] getMentors() {
        return mentors;
    }

    public void setMentors(String[] mentors) {
        this.mentors = mentors;
    }

    public String getPerson() {
        return person;
    }

    public void setPerson(String person) {
        this.person = person;
    }
}
