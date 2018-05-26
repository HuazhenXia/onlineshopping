package edu.mum.onlineshoping.report;
  
import java.security.Principal;
import java.sql.ResultSet;  
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;  
import net.sf.jasperreports.engine.JRDataSource;  
import net.sf.jasperreports.engine.JRResultSetDataSource;  
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;  
import org.springframework.web.bind.annotation.GetMapping;  
import org.springframework.web.bind.annotation.PathVariable;  
import org.springframework.web.bind.annotation.RequestMapping;  
import org.springframework.web.bind.annotation.RequestParam;  
import org.springframework.web.servlet.ModelAndView;

import edu.mum.onlineshoping.service.VendorService;

  
/** 
 * Created by X-J on 2017/6/1. 
 */  
@Controller  
@RequestMapping(value = "/reports")  
public class Report {  
  
  private static final String REPORT_NAME = "reportName";  
  private static final String FILE_FORMAT = "format";  
  private static final String DATASOURCE = "datasource";    
  
  @Autowired  
  private DataSource dbSource;  
  @Autowired 
  private VendorService vendorService;
  
  
  /** 
   * 直接使用模板文件中的sql语句得到报表 
   * @param modelMap 
   * @param reportName 
   * @param format 
   * @return 
   */  
  @GetMapping
  public String listWeeks(Model model, Principal principal) {
	  model.addAttribute("weeks", vendorService.findWeeks(principal.getName()));
	  return "listweeks";
  }
  
  @GetMapping("/admin/{reportName}")  
  public ModelAndView getReport(final ModelMap modelMap,  
      @PathVariable(REPORT_NAME) final String reportName,  
      @RequestParam(FILE_FORMAT) final String format) {  
    modelMap.put(DATASOURCE, dbSource);  
    modelMap.put(FILE_FORMAT, format);  
    ModelAndView modelAndView = new ModelAndView(reportName, modelMap); 
    return modelAndView;  
  }  
    
  /** 
   * 自定义sql语句并生成报表，要注意一点，select ? from ? where XXX 
   * where前面的语句需要写死，后面的where条件可以灵活传入 
   * 因为模板中的field需要先定义好并对应select A from中的A，才能出数据 
   * @param modelMap 
   * @param reportName 
   * @param format 
   * @param modelAndView 
   * @return 
   */  
  @GetMapping("/query/{reportName}")  
  public ModelAndView getReportByParamAndQuery(final ModelMap modelMap,  
      @PathVariable(REPORT_NAME) final String reportName,  
      Principal principal,
      HttpServletRequest request) {  
	  ModelAndView modelAndView=null;
    try {
    	  String queryStr = "SELECT \r\n" + 
    	  		"    DATE_FORMAT(o.order_date, '%Y%u') week,\r\n" + 
    	  		"    p.name,\r\n" + 
    	  		"    p.unit_price,\r\n" + 
    	  		"    SUM(od.quantity) soldnum,\r\n" + 
    	  		"    SUM(od.sub_total) totalmoney\r\n" + 
    	  		"FROM\r\n" + 
    	  		"    orders o,\r\n" + 
    	  		"    order_details od,\r\n" + 
    	  		"    product p,\r\n" + 
    	  		"    vendor v,\r\n" + 
    	  		"    user u\r\n" + 
    	  		"WHERE\r\n" + 
    	  		"    od.orders_id = o.id\r\n" + 
    	  		"        AND od.product_id = p.id\r\n" + 
    	  		"        AND p.vendor_id = v.id\r\n" + 
    	  		"        AND v.user_id = u.id\r\n" + 
    	  		"        AND DATE_FORMAT(o.order_date, '%Y%u') = '"+ request.getParameter("week") +"'\r\n" + 
    	  		"        AND u.username = '"+ principal.getName() +"'\r\n" + 
    	  		"GROUP BY week , od.product_id , p.name\r\n" + 
    	  		"ORDER BY week DESC , totalmoney DESC;";
      ResultSet resultSet = dbSource.getConnection().createStatement().executeQuery(queryStr); 
      JRDataSource jrDataSource = new JRResultSetDataSource(resultSet);  
      modelMap.put(DATASOURCE, jrDataSource);  
      modelMap.put(FILE_FORMAT, "pdf");  
      modelAndView = new ModelAndView(reportName, modelMap);  
    } catch (SQLException e) {  
      e.printStackTrace();  
    }  
    return modelAndView;  
  }  
}  