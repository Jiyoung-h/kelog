package keyLog.dao;

import java.util.List;

import keyLog.dto.MovielogDto;

public interface MovielogMapper {
	public List<MovielogDto> selectAllMovielog();
	public void insertMovielog(MovielogDto movielog);
	public MovielogDto detailMovielog(int no);
	public void updateMovielog(MovielogDto movielog);
	public String file_info(int no);
	public void deleteMovielog(int no);
}
