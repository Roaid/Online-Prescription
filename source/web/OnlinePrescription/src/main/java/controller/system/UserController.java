package controller.system;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Controller for supervision client
 */
@Controller
public class UserController {

    //TODO,Here you should autowired a service for further business logic processing

    private static final Logger logger = Logger.getLogger(UserController.class);

    @RequestMapping(value = "/loginPage")
    public String loginPage(ModelMap model) {

        return "domain/system/loginPage";
    }

    @RequestMapping(value = "/login")
    public String login(ModelMap model, @RequestParam("inputEmail") String email, @RequestParam("inputPassword") String pwd) {
        System.out.println("sadad"+email+"123");
        String page;
        if (email != null && !"".equals(email)) {
            page = "domainModel/demo/demoPage";
            model.addAttribute("message", email +" has logined.<br><br>Password is "+pwd);
        } else {
            page = "domainModel/system/loginPage";
        }
        return page;
    }


}
