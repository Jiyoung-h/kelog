package keyLog.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import keyLog.dao.MovielogMapper;
import keyLog.dao.UserMapper;
import keyLog.dto.MovielogDto;
import keyLog.service.MovielogService;

@Controller
public class MainController {

	@Autowired
	private UserMapper uMapper;
	
	@Autowired
	private MovielogMapper mMapper;

	@RequestMapping("/")
	public String main() {
		return "main";
	}
	@RequestMapping("/movie/write")
	public String movieWrite() {
		return "movieWrite";
	}
	@RequestMapping("/movie/insert")
	public String movieInsert(MovielogDto dto) {
		String filename="-";
		if(!dto.getFile1().isEmpty()) {
			filename=dto.getFile1().getOriginalFilename();
			String path="C:\\workspace-spring-tool-suite-4-4.8.0.RELEASE\\keylog\\src\\main\\webapp\\images\\";
			try {
				new File(path).mkdir();
				dto.getFile1().transferTo(new File(path+filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		dto.setImage_url(filename);
		mMapper.insertMovielog(dto);
		return "redirect:/movie";
	}
	@RequestMapping("list")
	public ModelAndView list(ModelAndView mav) {
		mav.setViewName("list");
		mav.addObject("list", uMapper.selectAllUser());
		return mav;
	}
	@RequestMapping("/movie")
	public ModelAndView movielist(ModelAndView mav) {
		mav.setViewName("movieList");
		mav.addObject("list", mMapper.selectAllMovielog());
		return mav;
	}
	
}
