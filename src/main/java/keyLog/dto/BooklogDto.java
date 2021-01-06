package keyLog.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class BooklogDto {
	private int no;
	private String title;
	private String genre;
	private String author;
	private String publisher;
	private String image_url;
	private MultipartFile file1;
	private String content;
	private String quote;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date releaseDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date viewDate;
	private int search;
	private int star;
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
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
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
	public int getSearch() {
		return search;
	}
	public void setSearch(int search) {
		this.search = search;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	@Override
	public String toString() {
		return "BooklogDto [no=" + no + ", title=" + title + ", genre=" + genre + ", author=" + author + ", publisher="
				+ publisher + ", image_url=" + image_url + ", file1=" + file1 + ", content=" + content + ", quote="
				+ quote + ", releaseDate=" + releaseDate + ", viewDate=" + viewDate + ", search=" + search + ", star="
				+ star + "]";
	}
	
}
