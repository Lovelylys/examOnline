package com.zh.Controller.teacher;

import com.github.pagehelper.PageInfo;
import com.zh.pojo.*;
import com.zh.pojo.User;
import com.zh.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 试题类型管理
 * @author hspcadmin
 *
 */
@Controller
@RequestMapping("/type")
public class TypeController {
	
	@Autowired
	TypeService typeService;
	
	@RequestMapping("/toTypePage.action")
	public String toTypePage(@RequestParam(value="page", defaultValue="1") int page,
							 Type type, Model model){
		qryTypePage(page,type,model);
		return "/teacher/type-mgt.jsp";
	}
	
	@RequestMapping("/qryTypePage.action")
	@ResponseBody
	public List<Type> qryTypePage(@RequestParam(value="page", defaultValue="1") int page,
                                  Type type, Model model){
//		List<Type> dataList = typeService.find(type);
		PageInfo<Type> pageInfo = typeService.findByPage(type, page, 5);
		List<Type> dataList = pageInfo.getList();
		model.addAttribute("dataList", dataList);
		model.addAttribute("pageInfo", pageInfo);
		return dataList;			
	}
	
	/**
	 * 删除题型信息
	 * @param typeId	题型编号，删除多个是，id用逗号分隔开
	 * @return
	 */
	@RequestMapping("/deleteType.action")
	public String deleteUser(String typeId){
		if(typeId != null){
			String ids[] = typeId.split(",");
			for(int i=0;i<ids.length;i++){
				typeService.delete(Integer.parseInt(ids[i]));
			}
		}
		return "redirect:/type/toTypePage.action";
	} 
	/**
	 * 跳转到添加用户信息页面
	 * @return
	 */
	@RequestMapping("/toAddType.action")
	public String toAddType(){
		return "/teacher/type-reg.jsp";
	}
	
	/**
	 * 添加题型信息
	 * @return
	 */
	@RequestMapping("/addType.action")
	public String addType(Type type){
		typeService.insert(type);
		return "redirect:/type/toTypePage.action";
	}
	
	/**
	 * 查看题型信息
	 * @param model
	 * @return
	 */
	@RequestMapping("/toQryType.action")
	public String toQryType(int typeId, Model model){
		Type typeInfo = typeService.get(typeId);
		model.addAttribute("type", typeInfo);
		return "/teacher/type-qry.jsp";
	}
	
	/**
	 * 跳转到更新题型信息页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/toUpdType.action")
	public String toUpdType(int typeId, Model model){
		Type typeInfo = typeService.get(typeId);
		model.addAttribute("type", typeInfo);
		return "/teacher/type-upd.jsp";
	}
	
	/**
	 * 更新题型信息
	 * @param type
	 * @return
	 */
	@RequestMapping("/updType.action")
	public String updType(Type type){
		typeService.update(type);
		return "redirect:/type/toTypePage.action";
	}
	
	/**
	 * 删除题型信息
	 * @return
	 */
	@RequestMapping("/delType.action")
	public String delType(int typeId){
		typeService.delete(typeId);
		return "redirect:/type/toTypePage.action";
	}
}
