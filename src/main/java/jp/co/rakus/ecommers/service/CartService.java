package jp.co.rakus.ecommers.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jp.co.rakus.ecommers.domain.Cinema;
import jp.co.rakus.ecommers.domain.Order;
import jp.co.rakus.ecommers.domain.OrderItem;
import jp.co.rakus.ecommers.domain.User;
import jp.co.rakus.ecommers.domain.Cart;
import jp.co.rakus.ecommers.repository.CinemaRepository;
import jp.co.rakus.ecommers.repository.OrderCinemaRepository;
import jp.co.rakus.ecommers.repository.OrderItemRepository;
import jp.co.rakus.ecommers.web.CartListChildPage;
import jp.co.rakus.ecommers.web.CartListPage;
import jp.co.rakus.ecommers.web.InsertForm;

/**
 * カートの操作をするServiceクラス.
 * 
 * @author takeshi.fujimoto
 *
 */

@Service
public class CartService {

	@Autowired
	private OrderCinemaRepository orderCinemaRepository;

	@Autowired
	private CinemaRepository cinemaRepository;

	@Autowired
	private OrderItemRepository orderItemRepository;

	/**
	 * カートに商品を追加するメソッド.
	 * 
	 * @param id
	 *            userID
	 * @param form
	 */
	@Transactional
	public void insertCart(User user, OrderItem orderItem) {
		java.util.Date utilDate = new java.util.Date();

		Order order = orderCinemaRepository.findCart(user);
		if (order == null) {
			order = new Order();
			order.setOrderNumber("20160623123456");
			order.setDate(utilDate);
			orderCinemaRepository.insertOrder(user, order);
			order = orderCinemaRepository.findCart(user);
		}

		orderCinemaRepository.saveOrderItem(orderItem, order);

		order = orderCinemaRepository.findCart(user);
		order.setTotalPrice(sumPrice(order.getOrderCinemaList()));
		order.setDate(utilDate);
		orderCinemaRepository.updateOrder(order);
	}

	/**
	 * カート内の商品一覧表示.
	 * 
	 * @param id
	 *            userId
	 * @return page情報
	 */
	public CartListPage findAllCart(User user) {
		CartListPage page = new CartListPage();
		List<CartListChildPage> init = new ArrayList<>();
		page.setCartListChildPage(init);
		Order order = orderCinemaRepository.findCart(user);
		// List<OrderItem> orderItemList =
		// orderCinemaRepository.findAllOrderItem(order);

		if (order == null || order.getOrderCinemaList() == null) {
			page.setCartListChildPage(null);
			return page;
		}

		for (OrderItem orderItem : order.getOrderCinemaList()) {
			CartListChildPage childPage = new CartListChildPage();
			Cinema cinema = cinemaRepository.findOne(orderItem.getCinemaId());
			childPage.setOrderCinemaId(orderItem.getId());
			childPage.setTitle(cinema.getTitle());
			childPage.setPrice(cinema.getPrice());
			childPage.setQuantity(orderItem.getQuantity());

			page.getCartListChildPage().add(childPage);
		}
		return page;
	}

	/**
	 * 削除を行うRepogitoryを呼び出す.
	 * 
	 * @param orderCinemaId
	 */
	@Transactional
	public void deleteCart(long orderCinemaId) {
		OrderItem orderItem = orderItemRepository.load(orderCinemaId);
		orderCinemaRepository.deleteByCinemaId(orderCinemaId);
		Order order = orderCinemaRepository.load(orderItem.getOrderId());
		order.setTotalPrice(sumPrice(order.getOrderCinemaList()));
//		order.setDate(new Date());
		orderCinemaRepository.updateOrder(order);
	}

	/**
	 * @param orderItemList
	 * @return
	 */
	public int sumPrice(List<OrderItem> orderItemList) {
		int sum = 0;
		if (orderItemList != null && ! orderItemList.isEmpty()) {
			for (OrderItem orderItem: orderItemList) {
				Cinema cinema = cinemaRepository.findOne(orderItem.getCinemaId());
				sum = sum + cinema.getPrice() * orderItem.getQuantity();
			}
		}
		return sum;
	}
	
	public void joinCart(User user, Long guestId) {
		Order order = orderCinemaRepository.findCart(user);
	}
}
