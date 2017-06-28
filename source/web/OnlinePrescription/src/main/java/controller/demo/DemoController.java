package controller.demo;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import service.demo.IDemoService;


@Controller
public class DemoController {

    @Autowired
    IDemoService demoService;

    private static final Logger logger = Logger.getLogger(DemoController.class);

    @RequestMapping(value = "/")
    public String index(ModelMap model) {
        //add attributes to the web page template through the "ModelMap" object.
        model.addAttribute("message", "Index page.");

        //This return value indicates to the web page template under directory "webapp/jsp/"
        return "domain/demo/demoPage";
    }

    @RequestMapping(value = "/demoPage")
    public String firstPage(ModelMap model) {
        //This is four different level of logging
        logger.info("Log4j info is working");
        logger.warn("Log4j warn is working");
        logger.debug("Log4j debug is working");
        logger.error("Log4j error is working");

        //add attributes to the web page template through the "ModelMap" object.
        model.addAttribute("message", "This is demo page of our online-prescription system.");

        //This return value indicates to the web page template under directory "webapp/jsp/"
        return "domain/demo/demoPage";
    }

    /**
     * restful API
     * @return JSON
     */
    @RequestMapping(value = "/getJSONData")
    public
    @ResponseBody
    List<Map<String, Object>> getJSONData() {
        //controller only processes network routing; service is designed to deal with the domain logic.
        return demoService.selectAllPerson();
    }

    /**
     * restful API
     * @return JSON
     */
    @RequestMapping(value = "/getSampleJSONData/{name}/{password}")
    public
    @ResponseBody
    String getSampleJSONData(@PathVariable String name, @PathVariable String password) {

        String key = name + "|" + password;
        JSONObject jo = new JSONObject();
        jo.put("values", new JSONArray(new Long[][]{{1025409600000L, 23L}, {1028088000000L, 19L}, {1030766400000L, 21L}, {1033358400000L, 22L}}));
        jo.put("key", (key == null) ? "North America" : key);

        JSONArray ja = new JSONArray();

        for (int i = 0; i < 10; i++) {
            ja.put(jo);
        }

        return ja.toString();
    }
    
    /**
     * 
     * Data-table Demo
     * @author Kunal Kanere
     */
    @RequestMapping(value = "/datatableDemoPage")
    public String datatableDemoPage(ModelMap model) {
        

        //add attributes to the web page template through the "ModelMap" object.
        model.addAttribute("message", "This is demo page to showcase jQuery Datatables");

        //This return value indicates to the web page template under directory "webapp/jsp/"
        return "domain/demo/datatableDemo";
    }
    
//    /**
//     * This is the ajax call to get json data for data-table
//     * @param request
//     * @param response
//     * @author Kunal Kanere
//     */
//    @RequestMapping(value="/getAllPersonJsonData")
//	public void getAllPersonJsonData(HttpServletRequest request , HttpServletResponse response){
//    	logger.info("demo data table called........");
//		JSONObject obj = null;
//		try{
//			PrintWriter out = response.getWriter();
//			obj = demoService.getAllPersonJsonData(request, response);
//			out.print(obj);
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
    /**
     * This is the ajax call to get json data for data-table (Modified by Stefan)
     * @param request
     * @author Kunal Kanere
     */
    @RequestMapping(value="/getAllPersonJsonData")
    @ResponseBody
    public String getAllPersonJsonData(HttpServletRequest request){
    	logger.info("demo data table called........");
		JSONObject obj = demoService.getAllPersonJsonData(request);
        return obj.toString();
	}

}