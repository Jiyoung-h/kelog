package keyLog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import keyLog.dao.MovielogMapper;
import keyLog.dto.MovielogDto;

public class MovielogServiceImpl implements MovielogService {
	@Autowired
    private MovielogMapper mMapper;
	
	@Override
	public List<MovielogDto> getMovielogList() {
		return mMapper.selectAllMovielog();
	}
	
	@Override
	public void write(MovielogDto movielog) {
		mMapper.insertMovielog(movielog);
	}
}
