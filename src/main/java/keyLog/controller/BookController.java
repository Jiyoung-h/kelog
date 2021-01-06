package keyLog.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import keyLog.dao.BooklogMapper;
import keyLog.dto.BooklogDto;

@Controller
public class BookController {
	@Autowired
	private BooklogMapper bMapper;
	@RequestMapping("/book/write")
	public String bookWrite() {
		return "book/bookWrite";
	}
	@RequestMapping("/book/mywrite")
	public String bookWrite2() {
		return "book/bookWrite2";
	}
	@RequestMapping("/book/insert")
	public String bookInsert(BooklogDto dto) {
		bMapper.insertBooklog(dto);
		return "redirect:/book";
	}
	@RequestMapping("/book/insert2")
	public String bookInsert2(BooklogDto dto) {
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
		bMapper.insertBooklog(dto);
		return "redirect:/book";
	}
	@RequestMapping("/book")
	public ModelAndView booklist(ModelAndView mav) {
		mav.setViewName("book/bookList");
		mav.addObject("list", bMapper.selectAllBooklog());
		return mav;
	}
	@RequestMapping("/book/detail/{no}")
	public ModelAndView detail(
			@PathVariable("no") int no, ModelAndView mav) {
		mav.setViewName("book/bookDetail");
		mav.addObject("dto", bMapper.detailBooklog(no));
		return mav;
	}
	@RequestMapping("/book/modify/{no}")
	public ModelAndView modify(
			@PathVariable("no") int no, ModelAndView mav) {
		mav.setViewName("book/bookModify");
		mav.addObject("dto", bMapper.detailBooklog(no));
		return mav;
	}
	@RequestMapping("/book/update")
	public String update(BooklogDto dto) {
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
			BooklogDto dto2 = bMapper.detailBooklog(dto.getNo());
			dto.setImage_url(dto2.getImage_url());
		}
		bMapper.updateBooklog(dto);
		return "redirect:/book/detail/"+dto.getNo();
	}
	@RequestMapping("/book/delete/{no}")
	public String delete(@PathVariable("no") int no) {
		String filename = bMapper.file_info(no);
		if(filename != null && !filename.equals("-")) {
			String path="C:\\workspace-spring-tool-suite-4-4.8.0.RELEASE\\keylog\\src\\main\\webapp\\images\\";
			File f=new File(path+filename);
			if(f.exists()) {
				f.delete();
			}
		}
		bMapper.deleteBooklog(no);
		return "redirect:/book";
	}
}
