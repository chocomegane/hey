package jp.co.rakus.ecommers.repository;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import jp.co.rakus.ecommers.domain.Cinema;

/**
 * 映画クラスの処理を行うRepository.
 * 
 * @author yusuke.nakano
 *
 */
@Repository
public class CinemaRepository {

	/** NamedParameterJdbcTemplateを利用するためのDI */
	@Autowired
	private NamedParameterJdbcTemplate template;

	/**
	 * 映画クラスのRowMapper
	 */
	private static final RowMapper<Cinema> cinemaRowMapper = (rs, i) -> {
		Long id = rs.getLong("id");
		String title = rs.getString("title");
		Integer price = rs.getInt("price");
		String genre = rs.getString("genre");
		Integer time = rs.getInt("time");
		Date releaseDate = rs.getTimestamp("release_date");
		String mediaType = rs.getString("media_type");
		String company = rs.getString("company");
		String directedBy = rs.getString("directed_by");
		String rating = rs.getString("rating");
		String description = rs.getString("description");
		String imagePath = rs.getString("image_path");
		boolean deleted = rs.getBoolean("deleted");
		return new Cinema(id, title, price, genre, time, releaseDate, mediaType, company, directedBy, rating,
				description, imagePath, deleted);
	};

	/**
	 * 映画のinsert, updateを行うメソッド. 引数に与えられたcinemaオブジェクトのフィールド変数id(主キー)がnullならば<br>
	 * insert, nullでなければupdate処理を行う
	 * 
	 * @param cinema
	 *            映画のオブジェクト
	 */
	public void save(Cinema cinema) {

		SqlParameterSource param = new BeanPropertySqlParameterSource(cinema);

		if (cinema.getId() == null) {
			template.update(
					"INSERT INTO cinemas(title, price, genre, time, release_date, media_type, company, directed_by, rating, description, image_path, deleted) values(:title, :price, :genre, :time, :releaseDate, :mediaType, :company, :directedBy, :rating, :description, :imagePath, :deleted)",
					param);
		} else {
			template.update(
					"UPDATE cinemas SET title = :title, price = :price, genre = :genre, time = :time, release_date = :releaseDate, media_type = :mediaType, company = :company, directed_by = :directedBy, rating = :rating, description = :description, image_path = :imagePath, deleted = :deleted WHERE id = :id",
					param);
		}
	}

	/**
	 * 映画のfindAllを行うメソッド.
	 * 
	 * @return 映画のリスト
	 */
	public List<Cinema> findAll() {
		String sql = "SELECT id, title, price, genre, time, release_date, media_type, company, directed_by, rating, description, image_path, deleted FROM cinemas ORDER BY title";
		List<Cinema> cinemaList = template.query(sql, cinemaRowMapper);
		return cinemaList;
	}

	/**
	 * 映画の詳細表示. 引数からIdを受け取り検索を行う
	 * 
	 * @param id
	 *            映画のId
	 * @return Idの映画の詳細情報
	 */
	public Cinema findOne(long id) {
		try {
			String sql = "SELECT id, title, price, genre, time, release_date, media_type, company, directed_by, rating, description, image_path, deleted FROM cinemas WHERE id=:id";
			SqlParameterSource param = new MapSqlParameterSource().addValue("id", id);
			Cinema cinema = template.queryForObject(sql, param, cinemaRowMapper);
			return cinema;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	/**
	 * ジャンルを条件に映画を検索.
	 * 
	 * @param genre
	 *            ジャンル.
	 * @return List<Cinema> 映画の情報が入ったリスト.
	 */
	public List<Cinema> findByGenre(String genre) {
		String sql = "SELECT id,title,price,genre,time,release_date,media_type,"
				+ "company,directed_by,rating,description,image_path,deleted "
				+ "FROM cinemas WHERE genre = :genre ORDER BY title";
		SqlParameterSource param = new MapSqlParameterSource().addValue("genre", genre);
		List<Cinema> cinemaList = template.query(sql, param, cinemaRowMapper);
		return cinemaList;
	}

	/**
	 * メディアタイプを条件に商品検索をするメソッド.
	 * 
	 * @param mediaType
	 *            メディアタイプ.
	 * @return List<Cinema> 映画の情報が入ったリスト.
	 */
	public List<Cinema> findByMediaType(String mediaType) {
		String sql = "SELECT id,title,price,genre,time,release_date,media_type,"
				+ "company,directed_by,rating,description,image_path,deleted "
				+ "FROM cinemas WHERE media_type = :mediaType ORDER BY title";
		SqlParameterSource param = new MapSqlParameterSource().addValue("mediaType", mediaType);
		List<Cinema> cinemaList = template.query(sql, param, cinemaRowMapper);
		return cinemaList;
	}

	/**
	 * 二つの価格の条件から商品を検索するメソッド.
	 * 
	 * @param minPrice
	 *            最低価格.
	 * @param maxPrice
	 *            最高価格.
	 * @return List<Cinema> 映画の情報が入ったリスト.
	 */
	public List<Cinema> findByMinMaxPrice(Integer minPrice, Integer maxPrice) {
		String sql = "SELECT id,title,price,genre,time,release_date,media_type,"
				+ "company,directed_by,rating,description,image_path,deleted "
				+ "FROM cinemas WHERE :minPrice <= price AND price <= :maxPrice ORDER BY title";

		SqlParameterSource param = new MapSqlParameterSource().addValue("minPrice", minPrice).addValue("maxPrice",
				maxPrice);
		List<Cinema> cinemaList = template.query(sql, param, cinemaRowMapper);
		return cinemaList;
	}

	/**
	 * 一つの価格の条件から商品を検索するメソッド.
	 * 
	 * @param minPrice
	 *            最低価格.
	 * @return List<Cinema> 映画の情報が入ったリスト.
	 */
	public List<Cinema> findByMinPrice(Integer minPrice) {
		String sql = "SELECT id,title,price,genre,time,release_date,media_type,"
				+ "company,directed_by,rating,description,image_path,deleted "
				+ "FROM cinemas WHERE :minPrice <= price ORDER BY title";

		SqlParameterSource param = new MapSqlParameterSource().addValue("minPrice", minPrice);
		List<Cinema> cinemaList = template.query(sql, param, cinemaRowMapper);
		return cinemaList;
	}

	/**
	 * タイトルの条件から商品の情報を検索数メソッド.
	 * 
	 * @param title
	 * @return
	 */
	public List<Cinema> findByTitle(String title) {
		String sql = "SELECT id,title,price,genre,time,release_date,media_type,"
				+ "company,directed_by,rating,description,image_path,deleted "
				+ "FROM cinemas WHERE title LIKE :title ORDER BY title";

		SqlParameterSource param = new MapSqlParameterSource().addValue("title", title);
		List<Cinema> cinemaList = template.query(sql, param, cinemaRowMapper);
		return cinemaList;
	}

}