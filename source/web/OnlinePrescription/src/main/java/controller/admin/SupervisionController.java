package controller.admin;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Controller for supervision client
 */
@Controller
public class SupervisionController {

    //TODO,Here you should autowired a service for further business logic processing

    private static final Logger logger = Logger.getLogger(SupervisionController.class);

    @RequestMapping(value = "/supervisionIndex")
    public String supervisionIndex(ModelMap model) {

        String greeting = "Index is being accessed.";
        model.addAttribute("message", greeting);

        logger.debug(greeting);

        return "supervisionIndex";
    }

}
