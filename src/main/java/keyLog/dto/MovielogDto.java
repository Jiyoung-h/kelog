package keyLog.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class MovielogDto {
	private int no;
	private String title;
	private String genre;
	private String director;
	private String actor;
	private String place;
	private String withwho;
	private String image_url;
	private MultipartFile file1;
	private String content;
	private String quote;
	private String writer;
	private int rating;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date releaseDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date viewDate;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getWithwho() {
		return withwho;
	}
	public void setWithwho(String withwho) {
		this.withwho = withwho;
	}
	public String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getQuote() {
		return quote;
	}
	public void setQuote(String quote) {
		this.quote = quote;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	public Date getViewDate() {
		return viewDate;
	}
	public void setViewDate(Date viewDate) {
		this.viewDate = viewDate;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	@Override
	public String toString() {
		return "MovielogDto [no=" + no + ", title=" + title + ", genre=" + genre + ", director=" + director + ", actor="
				+ actor + ", place=" + place + ", withwho=" + withwho + ", image_url=" + image_url + ", file1=" + file1
				+ ", content=" + content + ", quote=" + quote + ", writer=" + writer + ", rating=" + rating
				+ ", releaseDate=" + releaseDate + ", viewDate=" + viewDate + "]";
	}
	
}
