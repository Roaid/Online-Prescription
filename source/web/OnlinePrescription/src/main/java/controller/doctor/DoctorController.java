package controller.doctor;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Controller for doctor client
 */
@Controller
public class DoctorController {

    //TODO,Here you should autowired a service for further business logic processing

    private static final Logger logger = Logger.getLogger(DoctorController.class);

    @RequestMapping(value = "/doctorIndex")
    public String doctorIndex(ModelMap model) {

        String greeting = "Index is being accessed.";
        model.addAttribute("message", greeting);

        logger.debug(greeting);

        return "doctorIndex";
    }

}
