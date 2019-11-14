package components.repository;

import atg.repository.MutableRepositoryItem;
import atg.repository.RepositoryException;
import atg.repository.servlet.RepositoryFormHandler;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;

import javax.servlet.ServletException;
import java.io.IOException;
import java.util.*;

public class RepositoryFormHandlersPersonEdit extends RepositoryFormHandler {
    private String[] mentors;
   // private String[] menId;
    private String men;

    protected void postUpdateItemProperties(MutableRepositoryItem pItem) throws ServletException, IOException {
        try {
            Set<MutableRepositoryItem> mentorList = new HashSet<>();
            for (String mentorId : mentors) {
                MutableRepositoryItem itemMentor = this.getRepository().getItemForUpdate(mentorId, "user");
                mentorList.add(itemMentor);
            }

           /* Set<MutableRepositoryItem> mentorList2 = new HashSet<>();
            for (String mentorId : menId) {
                this.getRepository().removeItem(mentorId, "user");
                mentorList2.remove(mentorId);
            }*/
            pItem.setPropertyValue("mentorUser", mentorList);

        } catch (RepositoryException e) {
            e.printStackTrace();
        }

        super.postUpdateItemProperties(pItem);

    }

    public boolean handleDelete(DynamoHttpServletRequest pRequest, DynamoHttpServletResponse pResponse) throws ServletException, IOException {
        //String key = pRequest.getParameter("men");
        try {
                logDebug("IDDD"+ men);
                this.getRepository().removeItem(men, "mentorUser");

        } catch (RepositoryException e) {
            e.printStackTrace();
        }
        return true;

    }


    public String[] getMentors() {
        return mentors;
    }

    public void setMentors(String[] mentors) {
        this.mentors = mentors;
    }

    public String getMen() {
        return men;
    }

    public void setMen(String men) {
        this.men = men;
    }
}
