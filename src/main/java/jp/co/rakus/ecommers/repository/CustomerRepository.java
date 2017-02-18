package jp.co.rakus.ecommers.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import jp.co.rakus.ecommers.domain.Customer;

@Repository
public class CustomerRepository {
	
	
	
	/**
	 * 使用するテーブル名
	 * 最初に指定することでテーブル名変更時（あまりないと思うが）一か所の変更でいい
	 */
	private static final String TABLE_NAME = "customers";
	
	
	/** NamedParameterJdbcTemplateを利用するためのDI */
	
//	memo: http://www.oki-osk.jp/esc/spring/spring02.html
//	JdbcTemplateはSpring JDBCサポートのコアクラスです。JDBC APIではデータソースからコネクションの取得、
//	PreparedStatementの作成、ResultSetの解析、コネクションの解放などを行う必要がありますが、
//	JdbcTemplateを使うことでこれらの処理の多くが隠蔽され、より簡単にデータアクセスを行うことができます。
	@Autowired
	private NamedParameterJdbcTemplate jdbcTemplate;
	
	/**
	 * 新規登録時のcustomresテーブルへのインサート処理
	 * @param customer　→　新規登録する顧客情報
	 */
	public void insertCustomer(Customer customer)
	{
		
//		memo: http://www.oki-osk.jp/esc/spring/spring02.html
		
		SqlParameterSource parameter = new BeanPropertySqlParameterSource(customer);
		//sql作成　now()は現在時刻
		//:カラム名　→　SQLバインド変数
		String sql = "INSERT INTO customers("
				+ 		"name"
				+ 		",password"
				+ 		",email"
				+ 		",creat_day"
				+ 		",update_day"
				+ 	") VALUES("
				+ 		":name"
				+ 		",:password"
				+ 		",:email"
				+ 		",now()"
				+ 		",now()"
				+ 	");";
		
		jdbcTemplate.update(sql, parameter);
	}
	

	
	
}
