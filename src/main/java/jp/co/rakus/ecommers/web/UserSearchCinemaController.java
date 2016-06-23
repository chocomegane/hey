package jp.co.rakus.ecommers.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jp.co.rakus.ecommers.service.CinemaListService;

/**
 * 利用者の商品検索画面を遷移するクラス.
 * 
 * @author tsubasa.kaneko
 *
 */
@Controller
@Transactional
@RequestMapping(value="/cinemaShop")
public class UserSearchCinemaController {

	@Autowired
	private CinemaListService service;
	
	/**
	 * ジャンルを条件に商品の情報を取得するメソッド.
	 * 
	 * @param genreStr 送られてきたリクエストパラメータ.
	 * @param model スコープに格納するパラム.
	 * @return フォワード先の名前.
	 */
	@RequestMapping(value="/searchCinemaGenre")
	public String listGenre(@RequestParam String genreStr, Model model){
		CinemaListPage listPage = service.findByGenre(genreStr);
		
		model.addAttribute("listPage", listPage);
		
		return "userCinemaList";
	}
	
	/**
	 * メディアタイプを条件に商品の情報を取得するメソッド.
	 * 
	 * @param mediaTypeStr リクエストパラメータ.
	 * @param model スコープに格納するパラム.
	 * @return フォワード先の名前.
	 */
	@RequestMapping(value="/searchCinemaMediaType")
	public String listMediaType(@RequestParam String mediaTypeStr, Model model){
		CinemaListPage listPage = service.findByMediaType(mediaTypeStr);
		
		model.addAttribute("listPage", listPage);
		
		return "userCinemaList";
	}
	
	/**
	 * 価格を条件に商品検索をするメソッド.
	 * 
	 * @param minPriceStr
	 * @param maxPriceStr
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/searchCinemaPrice")
	public String listPrice(@RequestParam String minPriceStr,
			@RequestParam String maxPriceStr, Model model){
		
		//minにしかリクエストパラメータが入っていなかったらfindByMinPriceメソッドを呼び出す
		
		CinemaListPage listPage = new CinemaListPage();
		
		if(maxPriceStr.isEmpty()){
			Integer minPrice = Integer.parseInt(minPriceStr);
			listPage = service.findByMinPrice(minPrice);
		}else{
			Integer minPrice = Integer.parseInt(minPriceStr);
			Integer maxPrice = Integer.parseInt(maxPriceStr);
			listPage = service.findByMinMaxPrice(minPrice, maxPrice);
		}
		
		model.addAttribute("listPage", listPage);
		
		return "userCinemaList";
		
	}
	
	/**
	 * タイトルを条件に商品を検索するメソッド.
	 * 
	 * @param title
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/searchCinemaTitle")
	public String listTitle(@RequestParam String title, Model model){
		
		//titleの中身が空だったらエラーメッセージを返す
		if(title.isEmpty()){
			model.addAttribute("message", "何か入力してください");
			//findAllで全件取得をする
			model.addAttribute("listPage", service.findAll());
			return "userCinemaList";
		}
		
		//あいまい検索のためにtitleに%を付ける
		title = "%" + title + "%";
		System.out.println("titleの中身の確認" + title);
		
		CinemaListPage listPage = service.findByTitle(title);
		
		System.out.println("listPAgeの中身を確認" + listPage);
		
		//何も取得できなかったらメッセージを表示する
		if(listPage.getChildPageList().size()==0){
			model.addAttribute("message2", "商品がありません");
			//findAllで全件取得をする
			model.addAttribute("listPage", service.findAll());
			return "userCinemaList";
		}
		
		model.addAttribute("listPage", listPage);
		
		return "userCinemaList";
	}
}