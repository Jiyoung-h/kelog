package keyLog.dao;

import java.util.List;

import keyLog.dto.MovielogDto;

public interface MovielogMapper {
	public List<MovielogDto> selectAllMovielog();
	public void insertMovielog(MovielogDto movielog);
}
