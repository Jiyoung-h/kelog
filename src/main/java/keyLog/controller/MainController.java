package keyLog.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import keyLog.dao.MovielogMapper;
import keyLog.dao.UserMapper;
import keyLog.dto.MovielogDto;

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
	@RequestMapping("/movie/mywrite")
	public String movieWrite2() {
		return "movieWrite2";
	}
	@RequestMapping("/movie/insert")
	public String movieInsert(MovielogDto dto) {
		mMapper.insertMovielog(dto);
		return "redirect:/movie";
	}
	@RequestMapping("/movie/insert2")
	public String movieInsert2(MovielogDto dto) {
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
	@RequestMapping("/movie/detail/{no}")
	public ModelAndView detail(
			@PathVariable("no") int no, ModelAndView mav) {
		mav.setViewName("/movieDetail");
		mav.addObject("dto", mMapper.detailMovielog(no));
		return mav;
	}
	@RequestMapping("/movie/modify/{no}")
	public ModelAndView modify(
			@PathVariable("no") int no, ModelAndView mav) {
		mav.setViewName("/movieModify");
		mav.addObject("dto", mMapper.detailMovielog(no));
		return mav;
	}
	@RequestMapping("/movie/update")
	public String update(MovielogDto dto) {
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
			dto.setImage_url(filename);
		} else {
			MovielogDto dto2 = mMapper.detailMovielog(dto.getNo());
			dto.setImage_url(dto2.getImage_url());
		}
		mMapper.updateMovielog(dto);
		return "redirect:/movie/detail/"+dto.getNo();
	}
	@RequestMapping("/movie/delete/{no}")
	public String delete(@PathVariable("no") int no) {
		String filename = mMapper.file_info(no);
		if(filename != null && !filename.equals("-")) {
			String path="C:\\workspace-spring-tool-suite-4-4.8.0.RELEASE\\keylog\\src\\main\\webapp\\images\\";
			File f=new File(path+filename);
			if(f.exists()) {
				f.delete();
			}
		}
		mMapper.deleteMovielog(no);
		return "redirect:/movie";
	}
}
