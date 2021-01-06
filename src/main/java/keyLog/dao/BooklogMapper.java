package keyLog.dao;

import java.util.List;

import keyLog.dto.BooklogDto;

public interface BooklogMapper {
	public List<BooklogDto> selectAllBooklog();
	public void insertBooklog(BooklogDto Booklog);
	public BooklogDto detailBooklog(int no);
	public void updateBooklog(BooklogDto Booklog);
	public String file_info(int no);
	public void deleteBooklog(int no);
}
