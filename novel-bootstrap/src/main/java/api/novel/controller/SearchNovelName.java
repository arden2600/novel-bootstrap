package api.novel.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.show.api.ShowApiRequest;

import api.novel.util.ConfigService;
import api.novel.util.ResponseUtil;
@Controller
@RequestMapping("/novel/nameSearch")
public class SearchNovelName {

	@RequestMapping(value="/key.do",method=RequestMethod.GET)
	public String searchNovelContentByName(@RequestParam(value="keyword")String keyword,HttpServletResponse response) throws Exception{
		System.out.println(ConfigService.sectionMap);
		String appId = ConfigService.getValue("SHOWAPI-AUTH","APPID");
		String secret = ConfigService.getValue("SHOWAPI-AUTH","SECRET");
	    String res = new ShowApiRequest("http://route.showapi.com/211-2", appId, secret)
						 .addTextPara("keyword", java.net.URLDecoder.decode(keyword,"utf-8")).get();
//		return res;
		return ResponseUtil.ajax(res.toLowerCase(),response,"text/html");
		
		/*
		 * {"showapi_res_code":0,"showapi_res_error":"",
		 * "showapi_res_body":{"ret_code":0,"pagebean":
		 * 			{"allPages":1,
		 * 			"contentlist":[{"typeName":"玄幻魔法","id":"84128","author":"烟雨江南","updateTime":"15-07-18","name":"永夜君王","type":"1","newChapter":" 章一七五 人迹","size":"5090K"}],
		 * 			"currentPage":1,"allNum":1,"maxResult":20}
		 * 		}
		 * }
		 */
	}
}
