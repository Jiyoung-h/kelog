package keyLog.service;

import java.util.List;

import keyLog.dto.MovielogDto;

public interface MovielogService {
	public List<MovielogDto> getMovielogList();
	public void write (MovielogDto movielog);
}
